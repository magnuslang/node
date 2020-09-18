FROM node:12.18.4-alpine3.12

WORKDIR /project

# Add node_modules/.bin to PATH
ENV PATH /project/node_modules/.bin:$PATH

RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh tzdata openssl su-exec

RUN chown -R node:node /project

CMD ["su-exec", "node", "npm", "start", "-s", "--"]