FROM bahmutov/cypress-deps

LABEL maintainer "Gleb Bahmutov https://github.com/bahmutov"

# Need Cypress itself
RUN npm set progress=false
RUN npm i -g --loglevel warn cypress-cli@0.13.1
