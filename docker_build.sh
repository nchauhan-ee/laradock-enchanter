#!/usr/bin/env bash

default_build () {
  export APP_NAME=$1
  export VERSION=$2

  if [ -z "$APP_NAME" ]; then
    log "Application name must be specified as first argument"
    exit 1
  fi

  if [ -z "$VERSION" ]; then
    log "Application version must be specified as second argument"
    exit 1
  fi

  log "Building $APP_NAME with version $VERSION."

  docker build --build-arg VERSION="${VERSION}" --no-cache --rm -t "${APP_NAME}:${VERSION}" .
}
