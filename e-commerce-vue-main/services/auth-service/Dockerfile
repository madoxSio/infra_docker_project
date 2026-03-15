# Stage 1: Build
FROM node:18-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .

# Stage 2: Production
FROM node:18-alpine
WORKDIR /app
# On copie TOUT ce qui a été buildé dans l'étape 1
COPY --from=build /app .
ENV NODE_ENV=prod
# On lance app.js (ou index.js) peu importe où il est
CMD ["sh", "-c", "if [ \"$NODE_ENV\" = 'dev' ]; then npm run dev; else node src/app.js; fi"]