class Strategy
  def self.move combinations
    if !combinations.include?("O")
      if combinations.include?(5)
        5
      else
        1
      end
    else
      if combinations.slice(0, 3).filter { |o| o.is_a? String }.count == 2
        combinations.slice(0, 3).filter { |o| o.is_a? Integer }[0]
      elsif combinations.slice(3, 3).filter { |o| o.is_a? String }.count == 2
        combinations.slice(3, 3).filter { |o| o.is_a? Integer }[0]
      end
    end
  end
end
