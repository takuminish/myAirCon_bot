# coding: utf-8

require 'http'
require 'json'
require 'dotenv'
#require 'eventmachine'
#require 'faye/websocket'

Dotenv.load

response = HTTP.post("https://slack.com/api/chat.postMessage",
                     params: {
                       token: ENV["SLACK_TOKEN"],
                       channel: "#general",
                       text: "こんにちは",
                       as_user: true
                     }
                    )
puts JSON.pretty_generate(JSON.parse(response.body))
