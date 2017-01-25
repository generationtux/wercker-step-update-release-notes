#!/bin/bash
STORY_NUMBER=`git log -1 HEAD --pretty=format:%s | grep -Po '(?<=ch)(\d+)'`

if [ -z $STORY_NUMBER ] ; then
    success "No release specified, tha ts not a problem, just letting you know."
fi
if [ $STORY_NUMBER ] ; then
    curl -v -H "x-api-key: $WERCKER_NOTIFY_RELEASE_NOTES_API_KEY" \
        -H 'Content-Type: application/json' \
        "$WERCKER_NOTIFY_RELEASE_NOTES_API_URL/release/$STORY_NUMBER" &&
    success "Story $STORY_NUMBER has been updated"
fi



