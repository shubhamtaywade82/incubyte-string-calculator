# frozen_string_literal: true

class StringCalculator
  DEFAULT_DELIMITERS = [",", "\n"].freeze

  def initialize
    @call_count = 0
  end

  def add(numbers)
    @call_count += 1

    delimiters, body = extract_delimiters_and_body(numbers.to_s)
    nums = tokenize(body, delimiters).map(&:to_i)

    validate_no_negatives!(nums)

    nums.reject { |n| n > 1000 }.sum
  end

  def get_called_count
    @call_count
  end

  private

  def extract_delimiters_and_body(input)
    delims = DEFAULT_DELIMITERS.dup
    return [delims, input] unless input.start_with?("//")

    header, rest = input.split("\n", 2)
    delims.concat(parse_header_delimiters(header))
    [delims, rest.to_s]
  end

  def parse_header_delimiters(header)
    if header.start_with?("//[")
      header.scan(/\[(.+?)\]/).flatten
    else
      [header[2..]]
    end
  end

  def tokenize(str, delims)
    return [] if str.empty?

    parts = str.split(Regexp.union(delims))
    parts.reject(&:empty?)
  end

  def validate_no_negatives!(nums)
    negs = nums.select(&:negative?)
    return if negs.empty?

    raise ArgumentError, "negative numbers not allowed #{negs.join(',')}"
  end
end