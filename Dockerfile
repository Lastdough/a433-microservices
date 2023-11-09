# Step 1: Using the official Node.js 14.21.3 image with alpine 3.17 as the base image
FROM node:14.21.3-alpine3.17

# Step 2: Label the image to denote the source of the Dockerfile in GitHub
LABEL org.opencontainers.image.source="https://github.com/Lastdough/a433-microservices/tree/proyek-pertama"

# Step 3: Set the working directory inside the container to /app
WORKDIR /app

# Step 4: Copy all files in the current directory to the working directory in the container
COPY . .

# Step 5: Set the environment variables to specify production mode and the database host
ENV NODE_ENV=production
ENV DB_HOST=item-db

# Step 6: Install production dependencies and build the application
RUN npm install --production --unsafe-perm && npm run build

# Step 7: Inform Docker that the container is listening on port 8080 at runtime
EXPOSE 8080

# Step 8: Define the command to run the application when the container starts
CMD ["npm", "start"]
