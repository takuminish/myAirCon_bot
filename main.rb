# coding: utf-8

require './Aircon.rb'
require 'dotenv'
require 'slack-ruby-client'

Dotenv.load

aircon = Aircon.new

Slack.configure do |conf|
  conf.token = ENV["SLACK_TOKEN"]
end

client = Slack::RealTime::Client.new

client.on :hello do
  puts "connected"
end

client.start!

=begin
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

    if (data["user"] === ENV["SLACK_USER"] && data["channel"] === ENV["CHANNEL"]) then
      if (data["text"] === "冷房" || data["text"] === "暖房" || data["text"] === "電源オフ") then
        aircon.operation(data["text"])
        ws.send({
                type: "message",
                channel: ENV["CHANNEL"],
                text: "<@#{data['user']}> #{data['text']}にしたよ!!\nいまのエアコンの状態は#{aircon.getStatus}だよ。"
                }.to_json)
      end
    end
    
  end
  
  ws.on :close do
    p "接続終了"
    ws = nil
    EM.stop
  end
end
=end
