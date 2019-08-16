FROM node:alpine as builder 

COPY package.json .
RUN npm install
COPY . .

RUN npm run build 

FROM nginx
COPY --from=builder /app/build usr/shar/nginx/html


