# This is the first phase image
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
# Seems not used anymore from ElasticBeanstalk
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
