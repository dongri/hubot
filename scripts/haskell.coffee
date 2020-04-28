# Description:
#   Evaluate one line of Haskell
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot haskell <script> - Evaluate one line of Haskell
#
# Author:
#   Dongri Jin

module.exports = (robot) ->
  robot.respond /(haskell)\s+(.*)/i, (msg)->
    script = msg.match[2]
    script = script.replace("“","\"")
    script = script.replace("”","\"")
    msg.http("http://tryhaskell.org/eval")
      .query({exp: script})
      .post() (err, res, body) ->
        switch res.statusCode
          when 200
            result = JSON.parse(body)
            if result.error
              msg.send result.error
            else
              if result.success
                x = [result.success.stdout.join(''), result.success.value, result.success.type]
                msg.send x...
          else
            msg.send "Unable to evaluate script: #{script}. Request returned with the status code: #{res.statusCode}"
