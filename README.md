# Install nodejs
```
$ curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

$ source ~/.bashrc

$ nvm list-remote

$ nvm install v12.16.2

$ node -v
v12.16.2
```

# Install Hubot
```
$ npm install -g yo generator-hubot

$ mkdir hubot
$ cd hubot
$ yo hubot

Owner: dongrify@gmail.com
Bot name: bot
Bot adapter: slack

$ bin/hubot

bot> bot ping
bot> PONG
bot> exit
```

# Install Forever
```
$ npm install -g forever
$ npm install -g coffee-script
```

# Get Slack Token
https://slack.com/apps

Search for hubot in the Search App Directory and install it.
```
API Token: xoxb-123456789-123456789-123456789ABCDE
```

# run.sh
```
$ vim run.sh
export HUBOT_SLACK_TOKEN=xoxb-123456789-123456789-123456789ABCDE
forever start -a -l ~/hubot.log -c coffee node_modules/hubot/bin/hubot -a slack
```

# Run on Docker Compose
```
$ vim docker-compose.yml

    # Setting slack token
    environment:
      - HUBOT_SLACK_TOKEN=xoxb-123456789-123456789-123456789ABCDE

$ docker-compose up
```
