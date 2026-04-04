# Use a specific version of Python 3.10 slim as base image
FROM python:3.10-slim-buster

# Update Debian repositories to archived ones
RUN sed -i 's/http:\/\/deb.debian.org/http:\/\/archive.debian.org/g' /etc/apt/sources.list \
    && apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends gcc libffi-dev musl-dev ffmpeg aria2 python3-pip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy requirements file to container
COPY requirements.txt /app/

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of your code into the container
COPY . /app/

# Expose the port on which your app will run (if applicable)
EXPOSE 8080

# Command to run the bot
CMD ["python", "main.py"]
