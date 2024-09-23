# frozen_string_literal: true

# top-level comment to satisfy Rubocop
class RomanNumeral
  DIGITS_TO_NUMERALS = {
    '1' => %w[M C X I],
    '2' => %w[MM CC XX II],
    '3' => %w[MMM CCC XXX III],
    '4' => ['', 'CD', 'XL', 'IV'],
    '5' => ['', 'D', 'L', 'V'],
    '6' => ['', 'DC', 'LX', 'VI'],
    '7' => ['', 'DCC', 'LXX', 'VII'],
    '8' => ['', 'DCCC', 'LXXX', 'VIII'],
    '9' => ['', 'CM', 'XC', 'IX']
  }.freeze

  attr_reader :digits

  def initialize(number)
    @digits = number.to_s.chars
    digits.unshift('0') until digits.length == 4
  end

  def to_roman
    numerals = []
    4.times do |index|
      next if digits[index] == '0'

      numerals << DIGITS_TO_NUMERALS.fetch(digits[index])[index]
    end
    numerals.join
  end
end

seventeen = RomanNumeral.new(17)
one_ninety = RomanNumeral.new(190)
one_hundred_nine = RomanNumeral.new(109)
thousand_ninety = RomanNumeral.new(1090)
p seventeen.to_roman
p one_ninety.to_roman
p one_hundred_nine.to_roman
p thousand_ninety.to_roman
