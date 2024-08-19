# Stage 1: Build the React app
FROM node:lts AS build

# Set the working directory
WORKDIR /usr/src/app

# Install app dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the React app
RUN npm run build

# Stage 2: Serve the React app with nginx
FROM nginx:alpine

# Copy the build output to the nginx html directory
COPY --from=build /usr/src/app/build /usr/share/nginx/html

# Expose the port nginx is using
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
