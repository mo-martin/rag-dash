FROM node:6
MAINTAINER moses.martin@skybettingandgaming.com

VOLUME /app
WORKDIR /app
COPY app/ .
# RUN cd /app && npm install
# CMD ["node", "/app/app.js"]
CMD ["sleep", "infinity"]
EXPOSE 3080
