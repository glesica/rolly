#!/usr/bin/env sh

if [ -z "$UV_PUBLISH_TOKEN" ]; then
  if [ -e .publish-token ]; then
    UV_PUBLISH_TOKEN="$(cat .publish-token)"
    export UV_PUBLISH_TOKEN
  else
    echo "must set UV_PUBLISH_TOKEN"
    exit 1
  fi
fi

uv build --no-sources
uv publish
uv run --with rolly --no-project --refresh-package rolly -- python -c "import rolly"
