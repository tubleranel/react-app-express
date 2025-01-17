# Use an official Node.js runtime as a parent image
FROM node:18

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Run prisma
RUN npx prisma generate

# Expose the port the app runs on
EXPOSE 8080

# Command to run the application
CMD ["npm", "run", "start"]
