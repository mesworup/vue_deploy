# Use an older Node version for compatibility with Webpack 2/Vue 2
FROM node:14-alpine

WORKDIR /app

# Install dependencies with the legacy flag
COPY package*.json ./
RUN npm install --legacy-peer-deps

# Copy the rest of the source code
COPY . .

# Build both client and server bundles
RUN npm run build

# The app runs on port 8080 by default in most SSR kits, 
# check your server/index.js if it's different
EXPOSE 8080

# Start the Node.js server
CMD ["npm", "start"]