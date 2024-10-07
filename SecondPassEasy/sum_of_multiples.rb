class SumOfMultiples
  def initialize(*set)
    @set = set.empty? ? [3, 5] : set
  end

  def to(number)
    multiples = []
    number.times do |num|
      @set.each { |mult| multiples << num if (num % mult).zero? }
    end
    multiples.uniq.sum
  end

  def self.to(number)
    SumOfMultiples.new.to(number)
  end
end
