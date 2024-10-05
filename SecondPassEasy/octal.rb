class Octal
  def initialize(octal)
    @octal = octal
  end

  def to_decimal
    return 0 if @octal.chars.any? do |char|
      ('a'..'z').to_a.include? char.downcase
    end

    octal_number = @octal.chars.reverse.map(&:to_i)
    return 0 if octal_number.include?(8) || octal_number.include?(9)

    decimal_number = 0
    octal_number.length.times do |mag|
      decimal_number += (octal_number[mag] * (8**mag))
    end
    decimal_number
  end
end
