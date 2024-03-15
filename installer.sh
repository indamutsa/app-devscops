#!/bin/bash
apt-get -y -qq update

apt-get -y -qq  install software-properties-common # installation of python3 and python3-pip
add-apt-repository ppa:deadsnakes/ppa
apt-get -y -qq update
apt-get -y -qq install python3
apt-get -y -qq install python3-pip # python3 and pip installed

apt-get -y -qq install git # installing git

python3 -m pip install -r requirements.txt #installing pip requirements


# #!/bin/sh
# # Update the apk repository and install essential packages
# apk update

# # Install Python3 and pip (Python3 and pip are bundled together in Alpine)
# apk add --no-cache python3 py3-pip

# # Install git
# apk add --no-cache git

# # Install the pip requirements
# pip3 install -r requirements.txt
