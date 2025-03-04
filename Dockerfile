# ใช้ Node.js Version 18
FROM node:18-alpine
 
RUN apk update && apk add --no-cache nodejs npm

# Set working directory
WORKDIR /usr/src/app
 
# Copy Package Files
COPY package.json ./
 
RUN npm install
 
# Copy Source Code
COPY . .
 
EXPOSE 3000
 
CMD ["npm", "start"]