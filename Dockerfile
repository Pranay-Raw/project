# Use the official Node.js image from Docker Hub
FROM node:14

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json for dependency installation
COPY package*.json ./

# Install application dependencies
RUN npm install

# Copy the rest of the application code into the container
COPY . .

# Expose port 3000 (or the port your app listens to)
EXPOSE 3000 80

# Run the Node.js application
CMD ["npm", "start"]
