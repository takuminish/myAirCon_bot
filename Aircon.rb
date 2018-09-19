class Aircon
  @status = ""
  @temp = ""

  def operation(instruction)

    case instruction
    when "cool" then self.cool
    when "hot" then self.hot
    when "off" then self.off
    end
  end

  def cool

    @status = "cool"
  end

  def hot

    @status = "hot"
  end

  def odd

    @status = "off"
  end
    
end
