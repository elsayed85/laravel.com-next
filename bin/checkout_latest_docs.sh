#!/bin/bash

DOCS_VERSIONS=(
  master
  8.x
  7.x
)

for v in "${DOCS_VERSIONS[@]}"; do
    if [ -d "resources/docs/$v" ]; then
        echo "Pulling latest documentation updates for $v..."
        (cd resources/docs/$v && git pull)
    else
        echo "Cloning $v..."
        git clone --single-branch --branch "$v" git@github.com:laravel/docs.git "resources/docs/$v"
    fi;
done
