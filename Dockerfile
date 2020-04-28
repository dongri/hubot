FROM node:12.16.2-alpine

LABEL maintainer="dongrify@gmail.com"

RUN mkdir -p /app/src

ADD package.json /app/package.json

WORKDIR /app/src

RUN cd /app
RUN rm -rf node_modules
RUN npm install
RUN npm install -g coffee-script

CMD coffee node_modules/hubot/bin/hubot -a slack
