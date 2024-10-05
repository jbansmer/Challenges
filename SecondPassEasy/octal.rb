class Octal
  def initialize(octal)
    @octal = octal
  end

  def to_decimal
    return 0 unless valid?

    octal_number = @octal.chars.reverse.map(&:to_i)
    decimal_number = 0
    octal_number.length.times do |mag|
      decimal_number += (octal_number[mag] * (8**mag))
    end
    decimal_number
  end

  private

  def valid?
    @octal.chars.all? do |char|
      ('0'..'7').to_a.include? char
    end
  end
end
