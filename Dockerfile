FROM node:10.1-alpine
RUN apk --update add redis postgresql-client

ARG NODE_ENV
ENV NODE_ENV $NODE_ENV

EXPOSE ${PORT} 9229 15432
COPY . /home/app
WORKDIR /home/app
RUN npm install
RUN npm install -g knex nyc babel-istanbul babel-core
CMD ./scripts/start.sh
