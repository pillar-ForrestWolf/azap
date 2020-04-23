#!/bin/bash -eu
# This saves the current directory path into a variable
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

rm -r public/dist/*

# Save the current directory to a stack, and switch to ../frontend
pushd "$DIR/../client"

# Optionally, build the React client (the chunk thing prevents the runtime main from being included inline in the html file)
pwd
INLINE_RUNTIME_CHUNK=false yarn run build

# Copy the Build directory stuff from client to server directory
cp -r build/* "${DIR}/public/dist/."

# If there are no parameters (the parameters are not set), default to Dev.
# Once we have dev/prod/test/etc. environments, we will want to set this up
#if [ -z "$@" ]; then
#    export env=dev
#else
#    export env=$1
#fi

popd

# docker build --build-arg "buildArg=${env}" . -f ./Dockerfile -t myfba_combined
docker build . -f ./Dockerfile -t azap_combined
