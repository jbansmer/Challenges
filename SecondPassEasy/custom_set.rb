class CustomSet
  def initialize(array = [])
    @set = array
  end

  def empty?
    set.empty?
  end

  def contains?(number)
    set.include? number
  end

  def subset?(other)
    set.all? { |num| other.set.include? num }
  end

  def disjoint?(other)
    set.none? { |num| other.set.include? num }
  end

  def eql?(other)
    set.uniq.sort == other.set.uniq.sort
  end

  def add(number)
    set.push(number) unless set.include?(number)
    self
  end

  def ==(other)
    set == other.set
  end

  def intersection(other)
    new_set = set.select do |num|
      other.set.include?(num)
    end
    CustomSet.new(new_set)
  end

  def difference(other)
    new_set = set.select do |num|
      !other.set.include?(num)
    end
    CustomSet.new(new_set)
  end

  def union(other)
    new_set = set
    other.set.each do |num|
      new_set.push(num) unless new_set.include?(num)
    end
    CustomSet.new(new_set.sort)
  end

  protected

  attr_reader :set
end
