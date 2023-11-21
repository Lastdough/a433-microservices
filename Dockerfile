# Using Node.js v16 Alpine as base image
FROM node:16.20.2-alpine3.18

# Label the source of the Dockerfile
LABEL org.opencontainers.image.source="https://github.com/Lastdough/a433-microservices/tree/order-service"

# Set working directory to /app
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install project dependencies
RUN npm install --only=production

# Copy project files and folders to the working directory
COPY . .

# Binds to port 3000
EXPOSE 3000

# Command to run the app
CMD [ "npm", "start" ]
