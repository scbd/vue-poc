FROM mhart/alpine-node:8.9.3

ENV HOST 0.0.0.0
ARG COMMIT
ENV COMMIT $COMMIT

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN apk update && apk upgrade && \
    apk add --no-cache bash

ONBUILD COPY . /usr/src/app/
ONBUILD RUN yarn


# Build app

ONBUILD RUN yarn build

EXPOSE 3333

# start command
CMD [ "yarn", "start" ]
