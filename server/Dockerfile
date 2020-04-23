FROM node:11.13.0 as build
WORKDIR .
COPY package.json ./
COPY yarn.lock ./
RUN yarn install
COPY . .
EXPOSE 3000
CMD ["yarn", "start"]
# RUN yarn start
