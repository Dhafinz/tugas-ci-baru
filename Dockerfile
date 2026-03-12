FROM alpine:latest as builder
WORKDIR /app
COPY /app/index.html .

FROM nginx:alpine
COPY --from=builder /app/index.html /usr/share/nginx/html/index.html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
