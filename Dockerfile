#tag as builder
FROM node:alpine as builder 
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
# run build is based on WORKDIR in this case /app/build
RUN npm run build 
# FROM statement tells it previous block is complete
FROM nginx
# copy something over from builder phase
COPY --from=builder /app/build /usr/share/nginx/html
# when start nginx container will start it for us; don't need to start


