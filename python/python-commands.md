# Python commands
## install python2
`yum install python2`
## show version
`python2 -V`
## install python3
`yum install python36`
## show version
`python3 -V`
## execute program
`python3 main.py`
# Python Package Manager (pip)
## show pip version
`pip3 -V`  
`pip2 -V`
`pip -V`
## install package via pip
`pip install flash`
## list packages installed
`pip list` or 
`pip freeze`
## search for package
`pip search package_name`
## show package install and detail
`pip show flask`
## sample requirements.txt
Flask==0.10.1  
Jinja2==2.7.3  
MarkupSafe==0.23   
Werkzeug==0.9.6  
requests==2.3.0   
gunicorn==18.0
## install from requirements.txt
`pip install -r requirements.txt`
## Capture all currently installed versions in a text file
`pip freeze > requirements.txt`
## upgrade installed package to latest version
`pip install flask --upgrade`
## Install most recent version in a range
`pip install requests>=2.22.0,<3`
## install specific version
`pip install requests==2.22.0`
## Install package, avoid a specific version
`pip install requests!=2.21.0`
## uninstall package
`pip uninstall flask`
# Other package managers
> easy install  
> wheels
