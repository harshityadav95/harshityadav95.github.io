# Use the official Jekyll Docker image as the base image
FROM jekyll/jekyll

# Set the working directory inside the container
WORKDIR /srv/jekyll

# Copy the contents of the current directory (where the Dockerfile is) into the container's working directory
COPY . /srv/jekyll

# Expose port 4000, which is used by the Jekyll server
EXPOSE 4000

# Start the Jekyll server when the container is run
CMD ["jekyll", "serve"]
