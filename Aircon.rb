# coding: utf-8

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
    system(ENV["COOL"])
  end

  def hot

    @status = "暖房"
     system(ENV["HOT"])
  end

  def off

    @status = "電源オフ"
     system(ENV["OFF"])
  end
    
end
