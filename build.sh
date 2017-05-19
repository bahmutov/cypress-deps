set e+x

# build image with everything needed to install, run and test Cypress

LOCAL_NAME=bahmutov/cypress-deps
echo "Building docker image $LOCAL_NAME"

docker build -t $LOCAL_NAME .
