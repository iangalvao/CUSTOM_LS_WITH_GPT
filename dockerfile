# Use the official Ubuntu 22.04 image as the base
FROM ubuntu:22.04

# Set the working directory
WORKDIR /app

# Install necessary dependencies for Python and basic tools
RUN apt-get update && apt-get install -y python3 python3-pip bash && apt-get clean

# Remove the default 'ls' command
RUN rm -f /bin/ls

# Copy the custom 'ls.py' script and installation script
COPY ls.py .
COPY install_ls.sh .

# Make the install script executable
RUN chmod +x install_ls.sh

# Run the installation script to set up the custom 'ls'
RUN ./install_ls.sh

# Set the custom ls command in the PATH
ENV PATH="/usr/local/bin:$PATH"

# Default command to open a bash shell for testing
CMD ["bash"]
