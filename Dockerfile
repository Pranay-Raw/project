# Use CentOS Stream as CentOS 8 is EOL
FROM centos:stream8

# Maintainer information
LABEL maintainer="pranayrawarkar@gmail.com"

# Set up repositories, install required packages in one RUN to minimize layers
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-* && \
    sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-* && \
    yum install -y java httpd zip unzip && \
    yum clean all && \
    rm -rf /var/cache/yum

# Set working directory
WORKDIR /var/www/html/

# Copy and extract the website template
COPY photogenic.zip .
RUN unzip -q photogenic.zip && \
    mv photogenic/* . && \
    rm -rf photogenic photogenic.zip

# Expose HTTP port
EXPOSE 80

# Start Apache in the foreground
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
