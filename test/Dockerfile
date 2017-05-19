FROM bahmutov/cypress-deps

LABEL maintainer "Gleb Bahmutov https://github.com/bahmutov"

# Need Cypress itself
RUN npm set progress=false
RUN npm i -g --loglevel warn cypress-cli@0.13.1

ARG CYPRESS_VERSION
ENV CYPRESS_VERSION ${CYPRESS_VERSION:-0.19.2}
RUN echo Cypress version to install $CYPRESS_VERSION
RUN cypress install
RUN cypress verify
RUN cypress --version
