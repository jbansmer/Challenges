# frozen_string_literal: true

# top-level comment to satisfy Rubocop
class SumOfMultiples
  def initialize(*set)
    @set = set.empty? ? [3, 5] : set
  end

  def self.to(number)
    SumOfMultiples.new.to(number)
  end

  def to(number)
    range = ((@set.min)..(number - 1)).to_a
    multiples = find_multiples(range)
    multiples.sum
  end

  private

  def find_multiples(range)
    multiples = []
    @set.each do |set_num|
      range.each do |range_num|
        multiples << range_num if (range_num % set_num).zero?
      end
    end
    multiples.uniq
  end
end
