# Use an official Python runtime as a parent image
FROM python:3.11.0b1-buster

# Set the working directory in the container to /app
WORKDIR /app

# Set environment variables:
# Prevents Python from writing pyc files to disc (equivalent to python -B option)
ENV PYTHONDONTWRITEBYTECODE 1
# Prevents Python from buffering stdout and stderr (equivalent to python -u option)
ENV PYTHONUNBUFFERED 1

# Install system dependencies
# Note: If you still encounter issues with the versions, consider removing the versions for dnsutils, libpq-dev, and python3-dev
RUN apt-get update && \
    apt-get install --no-install-recommends -y \
    dnsutils \
    libpq-dev \
    python3-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip to its latest version
RUN pip install --upgrade pip

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Make port 8000 available to the world outside this container
EXPOSE 8000

# Run the command to start uWSGI
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "--workers", "6", "pygoat.wsgi"]


# FROM python:3.11.0b1-buster

# # set work directory
# WORKDIR /app


# # dependencies for psycopg2
# RUN apt-get update && apt-get install --no-install-recommends -y dnsutils=1:9.11.5.P4+dfsg-5.1+deb10u9 libpq-dev=11.16-0+deb10u1 python3-dev=3.7.3-1 \
#  && apt-get clean \
#  && rm -rf /var/lib/apt/lists/*


# # Set environment variables
# ENV PYTHONDONTWRITEBYTECODE 1
# ENV PYTHONUNBUFFERED 1


# # Install dependencies
# RUN python -m pip install --no-cache-dir pip==22.0.4
# COPY requirements.txt requirements.txt
# RUN pip install --no-cache-dir -r requirements.txt


# # copy project
# COPY . /app/

# # install pygoat
# EXPOSE 8000

# RUN python3 /app/manage.py migrate
# WORKDIR /app/pygoat/
# CMD ["gunicorn", "--bind", "0.0.0.0:8000", "--workers","6", "pygoat.wsgi"]
