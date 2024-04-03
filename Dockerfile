FROM --platform=linux/amd64 node:20-slim

# Set the working directory
WORKDIR /usr/src/app

# Install chrome headless shell and suggested packages
RUN apt-get update \
    && apt-get install -y wget gnupg2 libglib2.0-0 libnss3 libdbus-1-3 libatk1.0-0 libatk-bridge2.0-0 libxcomposite1 libxdamage1 libxfixes3 libxrandr2 libgbm1 libxkbcommon0 libasound2 dbus-x11 fontconfig  \
    && rm -rf /var/lib/apt/lists/* \
    && npx @puppeteer/browsers install chrome-headless-shell@stable

# Avoid running Puppeteer as root by creating a new user and changing permissions
RUN groupadd -r pptruser && useradd -r -g pptruser -G audio,video pptruser \
    && mkdir -p /home/pptruser/Downloads \
    && chown -R pptruser:pptruser /home/pptruser \
    && chown -R pptruser:pptruser /usr/src/app

# Test inotify
RUN touch /tmp/testfile \
    && inotifywait -e modify /tmp/testfile & echo "Hello, World!" > /tmp/testfile \
    && rm /tmp/testfile

# Add your Puppeteer script
COPY chrome-headless-shell-test.js .
COPY package.json .

RUN npm install

# Start the D-Bus system daemon
RUN service dbus stop
RUN service dbus start
