# frozen_string_literal: true

class StringCalculator
  def initialize
    @call_count = 0
  end

  def add(numbers)
    @call_count += 1

    s = numbers.to_s
    delimiters = [",", "\n"]

    if s.start_with?("//")
      header, rest = s.split("\n", 2)
      if header.start_with?("//[")
        delimiters.concat(header.scan(/\[(.+?)\]/).flatten)
      else
        delimiters << header[2..]
      end
      s = rest.to_s
    end

    tokens = s.split(Regexp.union(delimiters)).reject(&:empty?)
    nums   = tokens.map(&:to_i)

    negatives = nums.select(&:negative?)
    raise ArgumentError, "negative numbers not allowed #{negatives.join(',')}" unless negatives.empty?

    nums.reject { |n| n > 1000 }.sum
  end

  def get_called_count
    @call_count
  end
end
