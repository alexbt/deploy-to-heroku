#!/bin/bash

git filter-branch -- --all

export GIT_SHORT_HASH=`git rev-parse --short HEAD`

curl -n -X PATCH https://api.heroku.com/apps/${HEROKU_APPNAME}/config-vars \
  -d '{
  "GIT_SHORT_HASH": "'"${GIT_SHORT_HASH}"'",
  "CI_BUILD_NUMBER": "'"${GIT_SHORT_HASH}"'"
}' \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $HEROKU_API_KEY" \
  -H "Accept: application/vnd.heroku+json; version=3"
  
git remote add heroku-remote https://$HEROKU_USERNAME:$HEROKU_API_KEY@git.heroku.com/$HEROKU_APPNAME.git
git push -f heroku-remote master
