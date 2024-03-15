#!/bin/sh
# Update the apk repository and install essential packages
apk update

# Install Python3 and pip (Python3 and pip are bundled together in Alpine)
apk add --no-cache python3 py3-pip

# Install git
apk add --no-cache git

# Install the pip requirements
pip3 install -r requirements.txt
