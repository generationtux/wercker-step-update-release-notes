#!/bin/bash
STORY_NUMBER=`git log -1 HEAD --pretty=format:%s | grep -Po '(?<=ch)(\d+)'`

if [ -z $STORY_NUMBER ] ; then
    echo "No release specified, thats not a problem, just letting you know."
    exit 0
fi

curl -v -H "x-api-key: $WERCKER_NOTIFY_RELEASE_NOTES_API_KEY" \
  -H 'Content-Type: application/json' \
  "$WERCKER_NOTIFY_RELEASE_NOTES_API_URL/release/$STORY_NUMBER"



