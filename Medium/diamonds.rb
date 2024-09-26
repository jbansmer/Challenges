# frozen_string_literal: true

# top-level comment to satisfy Rubocop
class Diamond
  def self.make_diamond(max_letter)
    return "A\n" if max_letter == 'A'

    Diamond.new(max_letter).make_diamond
  end

  def make_diamond
    build_diamond
    top_half.pop
    "#{(top_half + bottom_half).join("\n")}
"
  end

  private

  attr_reader :max_letter, :width, :all_letters
  attr_accessor :top_half, :bottom_half

  def initialize(max_letter)
    @max_letter = max_letter
    @width = ('A'..max_letter).to_a.length * 2 - 1
    @all_letters = ('B'..max_letter).to_a
    @top_half = ['A'.center(@width)]
    @bottom_half = ['A'.center(@width)]
  end

  def build_diamond
    all_letters.each_with_index do |letter, spaces|
      space = ' '
      top_half.push "#{letter}#{space * spaces}#{space}#{space * spaces}#{letter}".center(width)
      bottom_half.unshift "#{letter}#{space * spaces}#{space}#{space * spaces}#{letter}".center(width)
    end
  end
end
