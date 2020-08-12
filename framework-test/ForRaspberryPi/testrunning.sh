#!/bin/bash
# Script to automatically get cadvisor raw data.
set -x

DATE=$(date +"%F_%T")
DIR="runtestData_$DATE"

if [[ -z "$1" ]]; then
        echo "No ip address provided. Usage: ./testRunning.sh <ip-address>"
        exit 1
fi
IP="$1"

sudo apt-get install -y \
        jq \
        wget

mkdir "$DIR"
cd "$DIR"
declare -a framework=("cvlc" "ffmpeg" "gstreamer")
declare -a codec=("_h264" "_vp8" "_mjpeg")

docker run \
        --rm \
        --volume=/:/rootfs:ro \
        --volume=/var/run:/var/run:ro \
        --volume=/sys:/sys:ro \
        --volume=/var/lib/docker/:/var/lib/docker:ro \
        --volume=/dev/disk/:/dev/disk:ro \
        --publish=8080:8080 \
        --detach=true \
        --name=cadvisor \
        unibaktr/cadvisor:latest

## loop through the 3 frameworks
for f in "${framework[@]}"
do
        ## loop through the codecs
        for c in "${codec[@]}"
        do
                NAME="${f}${c}"
                echo "Starting ${NAME} ..."
                docker run \
                        --rm \
                        --privileged \
                        --net=host \
                        -v ~/dev:/dev/video0 \
                        --name="${NAME}" \
                        -e IP="${IP}" \
                        --entrypoint="./${NAME}.sh" \
                        -d \
                        "$f"

                sleep 60
                wget -O "${NAME}"_1.json http://localhost:8080/api/v1.3/docker/"${NAME}"
                cp "${NAME}"_1.json "${NAME}".json
                for i in {2..3}
                do
                        sleep 60
                        cp "${NAME}".json "${NAME}"_copy.json
                        wget -O "${NAME}"_"${i}".json http://localhost:8080/api/v1.3/docker/"${NAME}"
                        jq '.[].stats += [inputs]' "${NAME}"_copy.json <(jq -c "values[] | .stats[]" "${NAME}"_"${i}".json) > "${NAME}".json
                done
                rm "${NAME}"_copy.json
                mkdir "${NAME}"_everyMinutes
                mv "${NAME}"_*.json "${NAME}"_everyMinutes/
                docker stop "${NAME}"
                echo "Finished with ${NAME}"
        done
done

echo "Starting mjpgstreamer ..."
docker run \
        --rm \
        --privileged \
        --net=host \
        -v ~/dev:/dev/video0 \
        --name=mjpgstreamer \
        -e IP="${IP}" \
        -d \
        mjpgstreamer

sleep 60
wget -O mjpgstreamer_1.json http://localhost:8080/api/v1.3/docker/mjpgstreamer
cp mjpgstreamer_1.json mjpgstreamer.json
for i in {2..3}
do
        sleep 60
        cp mjpgstreamer.json mjpgstreamer_copy.json
        wget -O mjpgstreamer_"${i}".json http://localhost:8080/api/v1.3/docker/mjpgstreamer
        jq '.[].stats += [inputs]' mjpgstreamer_copy.json <(jq -c "values[] | .stats[]" mjpgstreamer_"${i}".json) > mjpgstreamer.json
done
rm mjpgstreamer_copy.json
mkdir mjpgstreamer_everyMinutes
mv  mjpgstreamer_*.json mjpgstreamer_everyMinutes
docker stop mjpgstreamer
echo "Finished with mjpgstreamer"
echo "Stopping cadvisor..."
docker stop cadvisor
echo "Finished testrunning."

