FROM python:2.7
RUN pip install -r requirements.txt

# Use a lightweight Ubuntu base image
FROM ubuntu:22.04

# Create a working directory
WORKDIR /app

# Copy all files into the container
COPY . /app

# Expose the port used by MCGalaxy (default is 25565)
EXPOSE 10000

# Run the server using Mono
CMD ["mono", "MCGalaxyCLI.exe"]
