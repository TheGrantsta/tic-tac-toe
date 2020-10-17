class Strategy
  def self.move combinations
    if combinations.include?(5)
      5
    else
      1
    end
  end
end
