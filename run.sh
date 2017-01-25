#!/bin/bash

if [ ! $WERCKER_NOTIFY_RELEASE_NOTES_STORY_NUMBER ] ; then
    echo "No release specified, thats not a problem, just letting you know."
    exit 0
fi

 curl -v -H "x-api-key: $WERCKER_NOTIFY_RELEASE_NOTES_API_KEY" \
  -H 'Content-Type: application/json' \
  "$WERCKER_NOTIFY_RELEASE_NOTES_API_URL/release/$WERCKER_NOTIFY_RELEASE_NOTES_STORY_NUMBER"



