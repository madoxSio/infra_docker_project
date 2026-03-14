# Stage 1: Build
FROM node:18-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .

# Stage 2: Production
FROM node:18-alpine
WORKDIR /app
# On ne copie que les fichiers nécessaires
COPY --from=build /app/package*.json ./
COPY --from=build /app/node_modules ./node_modules
COPY --from=build /app/src ./src
ENV NODE_ENV=prod
CMD ["sh", "-c", "if [ \"$NODE_ENV\" = 'dev' ]; then npm run dev; else node src/index.js; fi"]