# Step 1: Build the React app
FROM node:18-alpine AS build
WORKDIR /app

# Install build dependencies for native modules
RUN apk add --no-cache python3 make g++ libc6-compat

# Copy package.json and lockfile, then install dependencies
COPY package*.json ./
RUN npm install --legacy-peer-deps

# Copy source code and build
COPY . .
ENV NODE_OPTIONS=--max_old_space_size=4096
RUN npm run build

# Step 2: Serve with Nginx
FROM nginx:alpine
# Remove default nginx static files
RUN rm -rf /usr/share/nginx/html/*
# Copy React build output
COPY --from=build /app/build /usr/share/nginx/html
# Copy custom nginx config (for SPA routing)
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
