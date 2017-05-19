set e+x

LOCAL_NAME=bahmutov/cypress-deps-test
echo "Building docker image $LOCAL_NAME"

docker build -t $LOCAL_NAME .
