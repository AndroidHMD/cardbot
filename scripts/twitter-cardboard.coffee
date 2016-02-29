# Description:
#   Continually searches for mentions of word/phrase on twitter
#   and reports new tweets
#
# Dependencies:
#   "twit": "1.1.x"
#
# Configuration:
#   HUBOT_TWITTER_CONSUMER_KEY
#   HUBOT_TWITTER_CONSUMER_SECRET
#   HUBOT_TWITTER_ACCESS_TOKEN_KEY
#   HUBOT_TWITTER_ACCESS_TOKEN_SECRET
#   HUBOT_TWITTER_MENTION_QUERY
#   HUBOT_TWITTER_MENTION_ROOM
#   HUBOT_TWITTER_INTERVAL_MINUTES
#
# Commands:
#   none
#
# Author:
#   Jonathan based on scripts by eric@softwareforgood, gkoo, timdorr
#

TWIT = require "twit"
MENTION_ROOM = process.env.HUBOT_TWITTER_MENTION_ROOM
#INTERVAL_MINUTES = process.env.HUBOT_TWITTER_INTERVAL_MINUTES

config =
  consumer_key: process.env.HUBOT_TWITTER_CONSUMER_KEY
  consumer_secret: process.env.HUBOT_TWITTER_CONSUMER_SECRET
  access_token: process.env.HUBOT_TWITTER_ACCESS_TOKEN_KEY
  access_token_secret: process.env.HUBOT_TWITTER_ACCESS_TOKEN_SECRET

getTwit = ->
  unless twit
    twit = new TWIT config

module.exports = (robot) ->
	receiveAndPost(robot)

receiveAndPost = (robot) ->
	twit = getTwit()
	id = process.env.HUBOT_TWITTER_FOLLOWING_ID
	stream = twit.stream('statuses/filter', follow: id)
	date = new Date

	stream.on 'tweet', (tweet) -> 
		n = date.getDay()

		if n == 1 or n == 3 or n == 5
			h = date.getHours()

			if h >= 9 and h <= 16
				message = "Tweet by @googlecardboard! http://twitter.com/#{tweet.user.screen_name}/status/#{tweet.id_str}"
				robot.messageRoom MENTION_ROOM, message
				return	
			else
				return
		else
			return

