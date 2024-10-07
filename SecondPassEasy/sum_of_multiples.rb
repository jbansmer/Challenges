class SumOfMultiples
  def initialize(*set)
    @set = set.empty? ? [3, 5] : set
  end

  def to(number)
    multiples = []
    1.upto(number - 1) do |num|
      multiples << num if multiple?(num)
    end
    multiples.sum
  end

  def self.to(number)
    SumOfMultiples.new.to(number)
  end

  private

  def multiple?(num)
    @set.any? { |mult| (num % mult).zero? }
  end
end
