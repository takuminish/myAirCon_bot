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
  puts "client connected"
end

client.on :message do |data|
  if data.channel === ENV["CHANNEL"] && data.user === ENV["SLACK_USER"]
    if aircon.operation(data.text)
      client.message channel: data.channel, text: "<@#{data['user']}> #{data['text']}にしたよ!!\nいまのエアコンの状態は#{aircon.getStatus}だよ。"
    else
      client.message channel: data.channel, text: "聞き方が違うかなぁ"
    end
    puts data
  end
end

client.on :closed do
  puts "client closed"
  client.start!
end

client.start!
