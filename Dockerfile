# Use a lightweight Ubuntu base image
FROM ubuntu:22.04

# Install Mono
RUN apt-get update && \
    apt-get install -y mono-complete && \
    apt-get clean

# Create a working directory
WORKDIR /app

# Copy all files into the container
COPY . /app

# Expose the port used by MCGalaxy (default is 25565)
EXPOSE 10000

# Run the server using Mono
CMD ["mono", "MCGalaxyCLI.exe"]
