# image de base pour le build
FROM node:18-alpine AS build

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

# image finale legere pour la prod
FROM node:18-alpine

WORKDIR /app

# on ne recupere que le necessaire du build
COPY --from=build /app /app

# port de l'app
EXPOSE 3001

# lancemet du service
CMD ["npm", "start"]