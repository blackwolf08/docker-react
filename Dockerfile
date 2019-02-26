# build our dependencies 
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . . 
RUN npm run build
# run our containere, copy BUILD catalog from the previous step

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html