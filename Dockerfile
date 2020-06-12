FROM node:alpine

RUN npm set progress=false && npm config set depth 0 && npm cache clean --force

RUN mkdir /app

WORKDIR /app

COPY package*.json ./

RUN npm i

COPY . .

EXPOSE 8080

ARG BUILD_ARG=test-fail

ENV ENV_NAME=$BUILD_ARG

RUN echo "hello $BUILD_ARG"


CMD [ "node", "app.js" ]