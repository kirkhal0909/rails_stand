FROM node:lts-alpine

WORKDIR /app

COPY ./frontend .
COPY ./frontend/package*.json ./

RUN npm install

EXPOSE 8080
