class Strategy
  def self.move combinations
    if !combinations.include?("O")
      if combinations.include?(5)
        5
      else
        1
      end
    else
      2
    end
  end
end
