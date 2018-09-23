FROM node:10-alpine

ARG version
RUN npm install -q -g vue-cli@${version}
VOLUME /app
EXPOSE 8080

WORKDIR /app
