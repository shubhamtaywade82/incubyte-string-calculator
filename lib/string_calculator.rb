# frozen_string_literal: true

class StringCalculator
  def add(numbers)
    s = numbers.to_s
    delimiters = [",", "\n"]
    tokens = s.split(Regexp.union(delimiters)).reject(&:empty?)
    tokens.map(&:to_i).sum
  end
end
