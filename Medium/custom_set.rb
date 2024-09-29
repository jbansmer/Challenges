class CustomSet
  attr_reader :set

  def initialize(array = [])
    @set = array
  end

  def empty?
    set.empty?
  end

  def contains?(element)
    set.include? element
  end

  def subset?(superset)
    set.all? { |num| superset.set.include? num }
  end

  def disjoint?(other)
    set.none? { |num| other.set.include? num }
  end

  def eql?(other)
    set.uniq.sort == other.set.uniq.sort
  end

  def add(num)
    set.include?(num) ? set : set.push(num)
  end

  def ==(other)
    other.class == CustomSet ? other.set : other
  end

  def intersection(other)
    intersected = (set + other.set).select do |num|
      set.include?(num) && other.set.include?(num)
    end
    CustomSet.new(intersected.uniq)
  end

  def difference(other)
    different = set.select { |num| !other.set.include? num }
    CustomSet.new(different)
  end

  def union(other)
    unified = (set + other.set).uniq.sort
    CustomSet.new(unified)
  end
end
