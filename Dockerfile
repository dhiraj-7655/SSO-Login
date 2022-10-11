# FROM node:12.18.3-alpine3.12 as builder
# WORKDIR /app
# COPY package.json package-lock.json ./
# RUN npm install
# COPY . .
# RUN npm run build




FROM node:12.18.3-alpine3.12 as builder
RUN mkdir -p app
WORKDIR /app
COPY package.json /app/
RUN rm -rf package-lock.json
RUN npm install --force && rm -rf dist/
COPY ./ /app/
#RUN ["/bin/sh",  "-c",  "envsubst < ./src/assets/env.template.js > ./src/assets/env.js"]
RUN npm run build
FROM nginx:alpine
COPY --from=builder /app/dist/InfinityFrontend /usr/share/nginx/html
EXPOSE 80