# frozen_string_literal: true

# top-level comment to satisfy Rubocop
class Octal
  def initialize(octal_number)
    @octal = valid?(octal_number) ? octal_number.to_i : 0
  end

  def to_decimal
    sum = 0
    @octal.digits.each_with_index do |num, index|
      sum += num * (8**index)
    end
    sum
  end

  private

  def valid?(number)
    valid_numbers = number.chars.select do |num|
      ('0'..'7').to_a.include? num
    end

    valid_numbers.join == number
  end
end
