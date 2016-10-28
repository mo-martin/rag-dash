FROM node:6
MAINTAINER moses.martin@skybettingandgaming.com

WORKDIR /app
COPY app/ .
RUN apt-get update
RUN cd /app
RUN npm install express --save 
RUN npm install
CMD ["node", "/app/app.js"]
#CMD ["sleep", "infinity"]
