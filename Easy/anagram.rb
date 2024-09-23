# frozen_string_literal: true

# top-level comment to satisfy Rubocop
class Anagram
  def initialize(word)
    @word = word
  end

  def match(list)
    list.select do |other_word|
      next if @word.downcase == other_word.downcase

      match?(other_word)
    end
  end

  def match?(other_word)
    @word.downcase.chars.sort == other_word.downcase.chars.sort
  end
end
