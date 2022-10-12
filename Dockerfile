# FROM node:12.18.3-alpine3.12 as builder
# WORKDIR /app
# COPY package.json package-lock.json ./
# RUN npm install
# COPY . .
# RUN npm run build




# FROM node:12.18.3-alpine3.12 as builder
# RUN mkdir -p app
# WORKDIR /app
# COPY package.json /app/
# RUN rm -rf package-lock.json
# RUN npm install --force && rm -rf dist/
# COPY ./ /app/
# #RUN ["/bin/sh",  "-c",  "envsubst < ./src/assets/env.template.js > ./src/assets/env.js"]
# RUN npm run build
# FROM nginx:alpine
# COPY --from=builder /app/dist/InfinityFrontend /usr/share/nginx/html
# EXPOSE 80

### STAGE 1: 
FROM node:12.7-alpine AS build
WORKDIR /usr/src/app
COPY package.json package-lock.json ./
RUN npm install
COPY . .
RUN npm run build### STAGE 2: Run ###FROM nginx:1.17.1-alpine
COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=build /usr/src/app/dist/aston-villa-app /usr/share/nginx/html