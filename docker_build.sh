#!/usr/bin/env bash

default_build () {
  export APP_NAME=$1
  export VERSION=$2
  export CONTAINER_REGISTRY=$3

  if [ -z "$APP_NAME" ]; then
    log "Application name must be specified as first argument"
    exit 1
  fi

  if [ -z "$VERSION" ]; then
    log "Application version must be specified as second argument"
    exit 1
  fi

  log "Building $CONTAINER_REGISTRY:$VERSION."

  docker build --no-cache --rm -t "${CONTAINER_REGISTRY}:${VERSION}" .
}
