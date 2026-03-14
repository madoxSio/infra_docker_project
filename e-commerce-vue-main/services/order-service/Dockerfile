FROM node:18-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .

FROM node:18-alpine
WORKDIR /app
COPY --from=build /app /app
# Port specifique au service order
EXPOSE 3002
CMD ["npm", "start"]