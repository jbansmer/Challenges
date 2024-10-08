class Verse
  attr_reader :bottles

  def initialize(bottles)
    @bottles = bottles
  end

  def build_verse
    case bottles
    when 2 then two_verse
    when 1 then one_verse
    when 0 then zero_verse
    else
      default_verse
    end
  end

  private

  def default_verse
    "#{bottles} bottles of beer on the wall, #{bottles} bottles of beer.\n" \
      "Take one down and pass it around, #{bottles - 1} bottles of beer " \
      "on the wall.\n"
  end

  def two_verse
    "2 bottles of beer on the wall, 2 bottles of beer.\n" \
      "Take one down and pass it around, 1 bottle of beer on the wall.\n"
  end

  def one_verse
    "1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
  end

  def zero_verse
    "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
  end
end

class BeerSong
  def self.verse(bottles)
    Verse.new(bottles).build_verse
  end

  def self.verses(first, last)
    verses = []
    first.downto(last) do |bottles|
      verses << verse(bottles)
    end
    verses.join("\n")
  end

  def self.lyrics
    verses(99, 0)
  end
end
