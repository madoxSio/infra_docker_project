# Stage 1: Build
FROM node:18-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Stage 2: Production
FROM nginx:alpine
WORKDIR /usr/share/nginx/html
COPY --from=build /app/dist .
COPY default.conf /etc/nginx/conf.d/default.conf
RUN addgroup -S appgroup && adduser -S appuser -G appgroup && \
    chown -R appuser:appgroup /usr/share/nginx/html /var/cache/nginx /var/run /var/log/nginx

# On prépare le fichier PID pour qu'appuser puisse l'écrire
RUN touch /var/run/nginx.pid && chown appuser:appgroup /var/run/nginx.pid

USER appuser
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]