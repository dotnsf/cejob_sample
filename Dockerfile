# https://nodejs.org/ja/docs/guides/nodejs-docker-webapp/

# base image
FROM node:12-alpine

# working directory
WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

CMD ["node", "app.js"]



