# Stage 1: Build
FROM node:18-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm install --production
COPY . .

# Stage 2: Production (Image finale)
FROM node:18-alpine
WORKDIR /app
RUN addgroup -S appgroup \
 && adduser -S appuser -G appgroup

COPY --from=build /app/package*.json ./
COPY --from=build /app/node_modules ./node_modules
COPY --from=build /app/src ./src

RUN chown -R appuser:appgroup /app
USER appuser

ENV NODE_ENV=production
EXPOSE 3000
CMD ["node", "src/app.js"]