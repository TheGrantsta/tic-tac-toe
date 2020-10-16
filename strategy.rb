class Strategy
  def self.move combinations
    if combinations[4] == 5
      5
    else
      1
    end
  end
end
