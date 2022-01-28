FROM node:14.17.6-alpine as build-stage
WORKDIR /app
COPY package*.json ./

RUN npm install
COPY . .
RUN npm run start

FROM nginx as production-stage
RUN mkdir /app
COPY nginx.conf /etc/nginx/nginx.conf