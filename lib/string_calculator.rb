# frozen_string_literal: true

class StringCalculator
  def add(numbers)
    s = numbers.to_s
    s.split(",").map(&:to_i).sum
  end
end
