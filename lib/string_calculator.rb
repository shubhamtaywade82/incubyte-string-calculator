# frozen_string_literal: true

class StringCalculator
  def add(numbers)
    s = numbers.to_s
    delimiters = [",", "\n"]

    if s.start_with?("//")
      header, rest = s.split("\n", 2)
      delimiters << header[2..]       # single custom delimiter after //
      s = rest.to_s                   # rest contains the actual numbers
    end

    tokens = s.split(Regexp.union(delimiters)).reject(&:empty?)
    tokens.map(&:to_i).sum
  end
end
