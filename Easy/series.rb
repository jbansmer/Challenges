# frozen_string_literal: true

# top-level comment to satisfy Rubocop
class Series
  def initialize(number_string)
    @numbers = number_string.chars.map(&:to_i)
  end

  def slices(length)
    raise ArgumentError.new, 'slice length is too long' if length > @numbers.length

    series = []
    @numbers.length.times do |index|
      break if @numbers[index + length - 1].nil?

      series << @numbers[index..(index + length - 1)]
    end
    series
  end
end
