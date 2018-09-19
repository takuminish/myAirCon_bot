# coding: utf-8
require 'http'

class Aircon
  @status = ""
  @temp = ""

  def operation(instruction)

    case instruction
    when "冷房" then self.cool
    when "暖房" then self.hot
    when "電源オフ" then self.off
    end
  end

  def cool

    @status = "cool"
    system(ENV["COOL"])
  end

  def hot

    @status = "hot"
     system(ENV["HOT"])
  end

  def off

    @status = "off"
     system(ENV["OFF"])
  end
    
end
