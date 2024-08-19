# Dockerfile
FROM node:lts

# Create app directory
WORKDIR /usr/src/testApp

# Install app dependencies
COPY package*.json ./
RUN npm install

# Bundle app source
COPY . .

# Expose port and start application
EXPOSE 3001
CMD ["npm", "start"]
