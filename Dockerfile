FROM ubuntu:22.04

# Avoid interactive prompts during package install
ENV DEBIAN_FRONTEND=noninteractive

# Update and install dependencies: Mono, Python, pip, etc.
RUN apt-get update && apt-get install -y \
    mono-complete \
    python2.7 \
    python2.7-dev \
    python-pip \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements and install Python dependencies
COPY requirements.txt /app/requirements.txt
RUN pip install -r /app/requirements.txt

# Set working directory
WORKDIR /app

# Copy all files
COPY . /app

# Expose the port your server uses
EXPOSE 10000

# Start the server using Mono
CMD ["mono", "MCGalaxyCLI.exe"]
