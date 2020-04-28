#!/bin/sh

export HUBOT_SLACK_TOKEN=xoxb-123456789-123456789-123456789ABCDE

forever start -a -l ~/hubot.log -c coffee node_modules/hubot/bin/hubot -a slack
