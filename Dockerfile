FROM node:6

LABEL maintainer "Gleb Bahmutov"

# Need Xvfb
RUN apt-get update --yes
RUN apt-get install --yes x11-xkb-utils \
  xfonts-100dpi xfonts-75dpi \
  xfonts-scalable xfonts-cyrillic x11-apps clang libdbus-1-dev libgtk2.0-dev \
  libnotify-dev libgnome-keyring-dev libgconf2-dev libasound2-dev libcap-dev \
  libcups2-dev libxtst-dev libxss1 libnss3-dev gcc-multilib g++-multilib
RUN apt-get install --yes xvfb

# Install Chrome

#============================================
# Google Chrome
#============================================
# can specify versions by CHROME_VERSION;
#  e.g. google-chrome-stable=53.0.2785.101-1
#       google-chrome-beta=53.0.2785.92-1
#       google-chrome-unstable=54.0.2840.14-1
#       latest (equivalent to google-chrome-stable)
#       google-chrome-beta  (pull latest beta)
#============================================
ARG CHROME_VERSION="google-chrome-stable"
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
  && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list \
  && apt-get update -qqy
RUN apt-get -qqy install \
    ${CHROME_VERSION:-google-chrome-stable}
RUN rm /etc/apt/sources.list.d/google-chrome.list \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/*
