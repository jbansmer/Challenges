class RomanNumeral
  DIGITS_TO_NUMERALS = {
    '1' => ['M', 'C', 'X', 'I'],
    '2' => ['MM', 'CC', 'XX', 'II'],
    '3' => ['MMM', 'CCC', 'XXX', 'III'],
    '4' => ['', 'CD', 'XL', 'IV'],
    '5' => ['', 'D', 'L', 'V'],
    '6' => ['', 'DC', 'LX', 'VI'],
    '7' => ['', 'DCC', 'LXX', 'VII'],
    '8' => ['', 'DCCC', 'LXXX', 'VIII'],
    '9' => ['', 'CM', 'XC', 'IX']
  }

  attr_reader :digits

  def initialize(number)
    @digits = number.to_s.chars
    until digits.length == 4
      digits.unshift('0')
    end
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

# seventeen = RomanNumerals.new(17)
# one_ninety = RomanNumerals.new(190)
# one_hundred_nine = RomanNumerals.new(109)
# thousand_ninety = RomanNumerals.new(1090)
# p seventeen.to_roman
# p one_ninety.to_roman
# p one_hundred_nine.to_roman
# p thousand_ninety.to_roman

=begin
The number of digits in the array is important: if there are 4, the first digit is a 1,000 digit, then a 100, then a 10, then a 1. Use the length of the array to determine the starting order of magnitude.
  - prepend "0"'s to the array to make it 4 elements long
The first digit should be analyzed and converted to the corresponding numeral. Move through the array and consider only numbers 1-9. If it is 0, move to the next digit.
M is the only 1,000 numeral.
D and C are numerals for 500 and 100, respectively.
L and X are numerals for 50 and 10, respectively.
V and I are numerals for 5 and 1, respectively.
For 900, 90, and 9, CM, XC, and IX are the numerals, respectively.
For 400, 40, and 4, CD, XL, and IV are the numerals, respectively.
Use a hash to link the necessary numbers.
  - 1-9 as keys and collections of orders of magnitude numerals as values
=end