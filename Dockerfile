FROM ubuntu:22.04

# Prevent interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install Mono only
RUN apt-get update && apt-get install -y mono-complete && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy all files
COPY . /app

# Expose your server port
EXPOSE 10000

# Run the server
CMD ["mono", "MCGalaxyCLI.exe"]
