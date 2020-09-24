c = get_config()
# Kernel config
c.IPKernelApp.pylab = 'inline'  # if you want plotting support always in your notebook
# Notebook config
c.NotebookApp.notebook_dir = 'jh'
#c.NotebookApp.allow_origin =  # put your public IP Address here
c.NotebookApp.ip = 'localhost'
c.NotebookApp.allow_remote_access = False
c.NotebookApp.open_browser = False
# ipython -c "from notebook.auth import passwd; passwd()"

c.NotebookApp.port = 8888
c.NotebookApp.allow_root = False
c.NotebookApp.allow_password_change = True