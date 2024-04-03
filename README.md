# Docker Chrome Headless Shell

Docker Chrome Headless Shell Sample

## Use Chrome Headless Shell Binary

```sh
cd chrome-headless-shell/linux-123.0.6312.86/chrome-headless-shell-linux64
./chrome-headless-shell
```

## Use Chrome Headless Shell Binary with ARGS

```sh
cd chrome-headless-shell/linux-123.0.6312.86/chrome-headless-shell-linux64

# minimal
./chrome-headless-shell --no-sandbox --disable-gpu --headless--disable-dev-shm-usage

# Full args
./chrome-headless-shell --disable-background-networking --disable-background-timer-throttling --disable-backgrounding-occluded-windows --disable-renderer-backgrounding --disable-breakpad --disable-client-side-phishing-detection --disable-default-apps --disable-dev-shm-usage --disable-extensions --disable-gpu --disable-popup-blocking --disable-prompt-on-repost --disable-sync --disable-translate --headless --hide-scrollbars --ignore-certificate-errors --ignore-certificate-errors-spki-list --ignore-ssl-errors --metrics-recording-only --mute-audio --no-first-run --no-sandbox --remote-debugging-address=0.0.0.0 --remote-debugging-port=9222 --safebrowsing-disable-auto-update --user-data-dir=/home/chromium/

```

## Enter the docker image

```sh
docker run -it --entrypoint /bin/bash docker-chrome-headless-shell:dev
```
