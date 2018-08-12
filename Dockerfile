### builder
FROM node:9-alpine as builder

WORKDIR /usr/app

COPY package.json .
RUN npm install 
COPY src src
COPY public public

RUN npm run build


### server
FROM nginx

COPY --from=builder /usr/app/build /usr/share/nginx/html
