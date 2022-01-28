FROM node:14.17.6-alpine as build-stage
WORKDIR /app
COPY package*.json ./

RUN npm install
COPY . .
# our app is running on port 5000 within the container, so need to expose it
EXPOSE 3000

# the command that starts our app
CMD ["node", "app.js"]

FROM nginx as production-stage
RUN mkdir /app
COPY nginx.conf /etc/nginx/nginx.conf
RUN npm run start
