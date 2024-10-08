class Series
  def initialize(number)
    @number = number
  end

  def slices(length)
    raise ArgumentError.new, 'toooo long!' unless @number.length >= length

    number_of_series = @number.length + 1 - length
    listed_numbers = @number.chars.map(&:to_i)
    all_series = []
    number_of_series.times do |idx|
      all_series << listed_numbers[idx...(idx + length)]
    end
    all_series
  end
end
