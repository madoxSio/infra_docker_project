# etape 1 : construction de l'app
FROM node:18-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# etape 2 : execution
FROM node:18-alpine
WORKDIR /app
# on recupere le build et le serveur de prod
COPY --from=build /app/dist ./dist
COPY --from=build /app/server.cjs ./
COPY --from=build /app/package*.json ./
RUN npm install --only=production

EXPOSE 8080
# on lance le petit serveur node pour servir le front
CMD ["node", "server.cjs"]