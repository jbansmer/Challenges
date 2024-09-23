# frozen_string_literal: true

# top-level comment to satisfy Rubocop
class PerfectNumber
  def initialize(input)
    raise StandardError.new, 'input must be a positive integer' unless input.positive?

    @number = input
    @divisors = [1]
  end

  def self.classify(input)
    @sum = PerfectNumber.new(input).classify

    if @sum > input
      'abundant'
    elsif @sum < input
      'deficient'
    else
      'perfect'
    end
  end

  def classify
    compile_divisors
    @sum = add_divisors
  end

  def compile_divisors
    2.upto(@number / 2) do |divisor|
      @divisors << divisor if (@number % divisor).zero?
    end
    @divisors
  end

  def add_divisors
    @divisors.sum
  end
end
