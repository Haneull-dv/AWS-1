FROM node:18-alpine

WORKDIR /app

# Install yarn v1 globally (1.22.19) and configure PATH
RUN apk add --no-cache curl && \
    curl -o- -L https://yarnpkg.com/install.sh | sh -s -- --version 1.22.19 && \
    apk del curl

# Add yarn to PATH
ENV PATH="/root/.yarn/bin:${PATH}"

# Copy package files
COPY package.json yarn.lock ./

# Clean yarn cache and install dependencies
RUN yarn cache clean && \
    yarn install --network-timeout 300000

# Copy the rest of the application
COPY . .

# Set environment variables
ENV NODE_ENV=development
ENV PORT=3000
ENV HOST=0.0.0.0

EXPOSE 3000

# Start the development server
CMD ["yarn", "dev"] 