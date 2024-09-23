# frozen_string_literal: true

class DNA
  attr_reader :sequence

  def initialize(sequence)
    @sequence = sequence
  end

  def hamming_distance(other)
    first_sequence = sequence.chars
    second_sequence = other.chars

    if shorter?(second_sequence)
      count_differences(first_sequence, second_sequence)
    elsif longer?(second_sequence)
      count_differences(second_sequence, first_sequence)
    else
      count_differences(first_sequence, second_sequence)
    end
  end

  def shorter?(other)
    sequence.length < other.length
  end

  def longer?(other)
    sequence.length > other.length
  end

  def count_differences(shorter_sequence, longer_sequence)
    differences = 0
    shorter_sequence.each_with_index do |letter, index|
      differences += 1 unless letter == longer_sequence[index]
    end
    differences
  end
end

p DNA.new('').hamming_distance('')

# 'ABC' and 'ADC' both have 3 letters, indexed 0-2. The [0] and [2] indexes should be compared, recognized as equivalent, and the number of differences unchanged. The [1] index shoould be recognized as not equivalent and the number of differences incremented by one.
# Iterating through each sequence and comparing the other_sequence's same indexed element can compare all letters in each string one at a time.
# When the sequence is shorter than the other_sequence, iterate by calling with the original (shorter) sequence.
# When the sequence is longer than the other_sequence, iterate by calling with the other (shorter) sequence.
