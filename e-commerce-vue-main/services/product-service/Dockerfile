FROM node:18-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .

FROM node:18-alpine
WORKDIR /app
COPY --from=build /app /app
# Port specifique au service product
EXPOSE 3000
CMD ["npm", "start"]