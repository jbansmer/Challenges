class PerfectNumber
  def self.classify(number)
    raise StandardError.new, 'negative numbers not allowed' unless number > 0

    divisors = find_divisors(number)
    if divisors.sum < number
      'deficient'
    elsif divisors.sum > number
      'abundant'
    else
      'perfect'
    end
  end

  class << self
    private

    def find_divisors(number)
      divisors = []
      1.upto(number / 2) do |num|
        divisors << num if (number % num).zero?
      end
      divisors
    end
  end
end
