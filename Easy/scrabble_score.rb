# frozen_string_literal: true

# top-level comment to satisfy Rubocop
class Scrabble
  VALUES = {
    1 => %w[A E I O U L N R S T],
    2 => %w[D G],
    3 => %w[B C M P],
    4 => %w[F H V W Y],
    5 => %w[K],
    8 => %w[J X],
    10 => %w[Q Z]
  }.freeze

  def initialize(word)
    word = '' if word.nil?
    @word = word.upcase.strip.chars
    @word_score = 0
  end

  def score
    return @word_score if @word.empty?

    @word.each do |letter|
      VALUES.each do |letter_score, letter_list|
        @word_score += letter_score if letter_list.include? letter
      end
    end
    @word_score
  end

  def self.score(word)
    Scrabble.new(word).score
  end
end
