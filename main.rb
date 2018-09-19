# coding: utf-8

require './Aircon.rb'
require 'http'
require 'json'
require 'dotenv'
require 'eventmachine'
require 'faye/websocket'

Dotenv.load

aircon = Aircon.new

response = HTTP.post("https://slack.com/api/rtm.start",
                     params: {
                       token: ENV["SLACK_TOKEN"],
                     }
                    )
rc = JSON.parse(response.body)

url = rc["url"]

EM.run do
  ws = Faye::WebSocket::Client.new(url)

  ws.on :open do
    p "接続成功"
  end

  ws.on :message do |event|
    p [:message, JSON.parse(event.data)]
    data = JSON.parse(event.data)
    p data["text"]
    aircon.operation("cool")
  end
  
  ws.on :close do
    p "接続終了"
    ws = nil
    EM.stop
  end
end
