class RomanNumeral
  NUMBER_TO_NUMERAL = {
    1 => ['M', 'C', 'X', 'I'],
    2 => ['MM', 'CC', 'XX', 'II'],
    3 => ['MMM', 'CCC', 'XXX', 'III'],
    4 => ['', 'CD', 'XL', 'IV'],
    5 => ['', 'D', 'L', 'V'],
    6 => ['', 'DC', 'LX', 'VI'],
    7 => ['', 'DCC', 'LXX', 'VII'],
    8 => ['', 'DCCC', 'LXXX', 'VIII'],
    9 => ['', 'CM', 'XC', 'IX'],
    0 => ['', '', '', '']
  }

  def initialize(number)
    @number = number
  end

  def to_roman
    numbers = number_to_numbers_array
    numerals = numbers.map.with_index do |num, idx|
      NUMBER_TO_NUMERAL[num][idx]
    end
    numerals.join
  end

  private

  def number_to_numbers_array
    numbers = @number.digits.reverse
    numbers.unshift(0) until numbers.length == 4
    numbers
  end
end
