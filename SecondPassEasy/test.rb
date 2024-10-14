# times
def times(number)
  counter = 0
  while counter < number
    yield(counter)
    counter += 1
  end
  number
end

times(5) do |num|
  puts "Iteration ##{num}"
end

# each
def each(collection)
  counter = 0
  while counter < collection.size
    yield(collection[counter])
    counter += 1
  end
  collection
end

each([1, 2, 3]) do |number|
  puts number + 2
end

each(['a', 'b', 'c']) do |letter|
  puts letter.upcase
end

# select - using a while loop
# def select(collection)
#   selected = []
#   counter = 0
#   while counter < collection.size
#     current = collection[counter]
#     selected << current if yield(current)
#     counter += 1
#   end
#   selected
# end

# select - using the above-defined #each
def select(collection)
  selected = []
  each(collection) do |element|
    selected << element if yield(element)
  end
  selected
end

select([1, 2, 3, 4]) do |number|
  number.odd?
end

select(['a', 'b', 'c', 'd']) do |letter|
  'cat'.include? letter
end

select([1, 3, 5, 7]) do |number|
  number.even?
end

# # reduce - using a while loop
# def reduce(collection, accumulator = nil)
#   if accumulator.nil?
#     accumulator = collection.first
#     counter = 1
#   else
#     counter = 0
#   end

#   while counter < collection.size
#     accumulator = yield(accumulator, collection[counter])
#     counter += 1
#   end
#   p accumulator
# end

# reduce - using the above-defined #each
def reduce(collection, accumulator = nil)
  if accumulator.nil?
    accumulator = collection.first

    each(collection) do |element|
      next if element == collection.first
      accumulator = yield(accumulator, element)
    end
  else
    each(collection) do |element|
      accumulator = yield(accumulator, element)
    end
  end
  accumulator
end

array = [1, 2, 3, 4, 5]

reduce(array) { |acc, num| acc + num }                    # => 15
reduce(array, 10) { |acc, num| acc + num }                # => 25
reduce(array, 1) { |acc, num| acc + num }                 # => 16
# reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass

reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']