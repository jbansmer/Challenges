class Scrabble
  # POINT_VALUES = {
  #   ['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'] => 1,
  #   ['D', 'G'] => 2,
  #   ['B', 'C', 'M', 'P'] => 3,
  #   ['F', 'H', 'V', 'W', 'Y'] => 4,
  #   ['K'] => 5,
  #   ['J', 'X'] => 8,
  #   ['Q', 'Z'] => 10
  # }

  POINT_VALUES = [
    ['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T', 1],
    ['D', 'G', 2],
    ['B', 'C', 'M', 'P', 3],
    ['F', 'H', 'V', 'W', 'Y', 4],
    ['K', 5],
    ['J', 'X', 8],
    ['Q', 'Z', 10]
  ]

  def initialize(word)
    @word = word.to_s.strip
  end

  # def score
  #   all_points = @word.chars.map do |letter|
  #     letter_points = 0
  #     POINT_VALUES.each do |letters, points|
  #       letter_points += points if letters.include? letter.upcase
  #     end
  #     letter_points
  #   end
  #   all_points.sum
  # end

  def score
    all_points = @word.chars.map do |letter|
      letter_points = 0
      POINT_VALUES.each do |arr|
        letter_points += arr.last if arr.include? letter.upcase
      end
      letter_points
    end
    all_points.sum
  end

  def self.score(word)
    Scrabble.new(word).score
  end
end

p Scrabble.new('abc').score
