#!/bin/bash

curl -n -X PATCH https://api.heroku.com/apps/${HEROKU_APPNAME}/config-vars \
  -d '{
  "GIT_SHORT_HASH": "'"${GIT_SHORT_HASH}"'",
  "CI_BUILD_NUMBER": "'"${GIT_SHORT_HASH}"'"
}' \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $HEROKU_API_KEY" \
  -H "Accept: application/vnd.heroku+json; version=3"
