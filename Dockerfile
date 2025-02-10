# Use lightweight Ubuntu as base image
FROM ubuntu:latest

# Set the maintainer information
LABEL maintainer="pranayrawarkar@gmail.com"

# Update package list and install required packages
RUN apt-get update && apt-get install -y \
    apache2 \
    unzip \
    wget && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory to Apache's root
WORKDIR /var/www/html/

# Download and extract the website template automatically
RUN wget -O website.zip https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip && \
    unzip -q website.zip && \
    mv photogenic/* . && \
    rm -rf photogenic website.zip

# Expose port 80 for HTTP traffic
EXPOSE 80 8080

# Start Apache in the foreground
CMD ["apachectl", "-D", "FOREGROUND"]
