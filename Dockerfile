FROM node:14.17.6-alpine as build-stage
WORKDIR /app
COPY package*.json ./

RUN npm install
COPY . .

EXPOSE 3000

# the command that starts our app
CMD ["node", "app."]

FROM nginx as production-stage
COPY nginx.conf /etc/nginx/nginx.conf
