FROM node:14.21.3-alpine3.17

LABEL org.opencontainers.image.source="https://github.com/Lastdough/a433-microservices/tree/proyek-pertama"

WORKDIR /app

COPY . .

ENV NODE_ENV=production
ENV DB_HOST=item-db

RUN npm install --production --unsafe-perm && npm run build

EXPOSE 8080

CMD ["npm", "start"]
