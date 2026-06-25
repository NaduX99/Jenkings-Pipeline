# Use a slim LTS Node.js image as the base image
FROM node:20-slim

# Set the working directory inside the container to /usr/src/app
WORKDIR /usr/src/app

# Copy dependency manifests first so Docker can cache npm install
COPY nodeapp/package*.json ./

# Run the npm install command to install the dependencies specified in package.json
RUN npm ci

# Copy the application source into the working directory
COPY nodeapp/ ./

# Expose port 3000 to allow incoming connections to the container
EXPOSE 3000

# Start the application by running the "npm start" command
CMD [ "npm", "start" ]
