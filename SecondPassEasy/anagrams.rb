class Anagram
  def initialize(word)
    @word = word
  end

  def match(words)
    words.select do |word|
      next if word.downcase == @word.downcase

      word.downcase.chars.sort == @word.downcase.chars.sort
    end
  end
end
