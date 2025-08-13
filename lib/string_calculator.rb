# frozen_string_literal: true

class StringCalculator
  def add(numbers)
    s = numbers.to_s
    delimiters = [",", "\n"]

    if s.start_with?("//")
      header, rest = s.split("\n", 2)
      delimiters << header[2..]
      s = rest.to_s
    end

    tokens = s.split(Regexp.union(delimiters)).reject(&:empty?)
    nums   = tokens.map(&:to_i)

    negatives = nums.select { |n| n.negative? }
    unless negatives.empty?
      raise ArgumentError, "negative numbers not allowed #{negatives.join(',')}"
    end

    nums.sum
  end
end
