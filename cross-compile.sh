#!/bin/bash

VERSION="0.10"

rm -rf dist; mkdir -p dist
for GOOS in darwin linux; do
  for GOARCH in 386 amd64; do
    echo "Building $GOOS-$GOARCH"
    if [[ $GOOS == "darwin" ]]; then
       env GOOS=$GOOS GOARCH=$GOARCH go build -o dist/aws-es-proxy-${VERSION}-mac-${GOARCH}
    else
      env GOOS=$GOOS GOARCH=$GOARCH go build -o dist/aws-es-proxy-${VERSION}-${GOOS}-${GOARCH}
    fi
  done
done
