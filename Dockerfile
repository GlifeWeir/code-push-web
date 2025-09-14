FROM node:6.9.5-alpine

# Copy application files
COPY ./build /usr/src/app
WORKDIR /usr/src/app
ARG CODE_PUSH_URI
ARG GOOGLE_TRACKING_ID
ARG WEBSITE_HOSTNAME

# Install Yarn and Node.js dependencies
RUN npm install yarn --global --no-progress --silent --depth 0 && \
    yarn install --production --no-progress

EXPOSE $PORT

CMD [ "node", "server.js" ]
