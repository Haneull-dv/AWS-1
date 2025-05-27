FROM node:18-alpine AS builder

# Enable corepack and set yarn version
RUN corepack enable && corepack prepare yarn@4.9.1 --activate

WORKDIR /app
COPY package.json yarn.lock .yarnrc.yml ./
COPY .yarn ./.yarn
RUN yarn install --immutable

COPY . .
RUN yarn build

FROM node:18-alpine AS runner

# Enable corepack and set yarn version in runner stage as well
RUN corepack enable && corepack prepare yarn@4.9.1 --activate

WORKDIR /app

ENV NODE_ENV=production

COPY --from=builder /app/public ./public
COPY --from=builder /app/.next/standalone ./
COPY --from=builder /app/.next/static ./.next/static

EXPOSE 3000
ENV PORT 3000
ENV HOSTNAME "0.0.0.0"

CMD ["node", "server.js"] 