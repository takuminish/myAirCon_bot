# coding: utf-8
require 'net/http'


class Aircon
  @status = ""
  @temp = ""

  def operation(instruction)

    case instruction
    when "冷房" then
      self.cool
      return true
    when "暖房" then
      self.hot
      return true
    when "電源オフ" then
      self.off
      return true
    else
      return false
    end
  end


  def getStatus
    return @status
  end
  
  def cool
    @status = "冷房"
    Net::HTTP.get(ENV["URL"], '/cool', ENV["PORT"])
  end

  def hot
    @status = "暖房"
    Net::HTTP.get(ENV["URL"], '/hot', ENV["PORT"])
  end

  def off
    @status = "電源オフ"
    Net::HTTP.get(ENV["URL"], '/off', ENV["PORT"])    
  end
    
end
