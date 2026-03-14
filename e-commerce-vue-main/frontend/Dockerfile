# Stage 1: Build
FROM node:18-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Stage 2: Production (ngix)
FROM nginx:stable-alpine
COPY --from=build /app/dist /usr/share/nginx/html
# Script magique pour choisir entre DEV (Vite) et PROD (Nginx)
ENV APP_ENV=prod
CMD ["sh", "-c", "if [ \"$APP_ENV\" = 'dev' ]; then npm install && npx vite --host 0.0.0.0; else nginx -g 'daemon off;'; fi"]