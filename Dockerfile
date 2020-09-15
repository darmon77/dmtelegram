# Gathering of binary
FROM alpine:edge
LABEL maintainer "Dennis Darmon"
RUN apk update && apk add telegram-desktop
RUN apk add shadow 

# Make a user
ENV HOME /home/telegram
RUN useradd --create-home --home-dir $HOME telegram \
        && chown -R telegram:telegram $HOME \
        && usermod -a -G audio,video telegram
WORKDIR $HOME
USER telegram

# Autorun Telegram
CMD ["telegram-desktop"]
