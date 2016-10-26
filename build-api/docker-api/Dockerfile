FROM node:6
MAINTAINER moses.martin@skybettingandgaming.com

WORKDIR /app
COPY app/ .
RUN cd /app && npm install express --save && npm install
CMD ["node", "/app/app.js"]
EXPOSE 3080
#CMD ["sleep", "infinity"]
