FROM node:14.21-alpine as builder

LABEL org.opencontainers.image.source="https://github.com/Lastdough/a433-microservices/tree/karsajobs-ui"

WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build
EXPOSE 8000
CMD [ "npm", "run", "serve" ]
