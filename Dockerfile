#Dockerfile

# Use this image as the platform to build the app
FROM node:20.11-alpine AS external-website

# A small line inside the image to show who made it
LABEL Developers="Linflas"

# The WORKDIR instruction sets the working directory for everything that will happen next
WORKDIR /app

# Copy all local files into the image
COPY . .

# Clean install all node modules
RUN npm ci

# Build SvelteKit app
RUN npm run build

# Delete source code files that were used to build the app that are no longer needed
RUN rm -rf src/ static/ emailTemplates/ docker-compose.yml

# The USER instruction sets the user name to use as the default user for the remainder of the current stage
USER node:node

# This is the command that will be run inside the image when you tell Docker to start the container
EXPOSE 3000
CMD ["node","build/index.js"]