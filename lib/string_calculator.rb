# frozen_string_literal: true

class StringCalculator
  def add(numbers)
    s = numbers.to_s

    if s.include?(',')
      a, b = s.split(',', 2)
      return a.to_i + b.to_i
    end

    s.to_i
  end
end
