# frozen_string_literal: true

# top-level comment to satisfy Rubocop
class BeerSong
  ZERO_BOTTLES_VERSE = "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
  ONE_BOTTLE_VERSE = "1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
  TWO_BOTTLES_VERSE = "2 bottles of beer on the wall, 2 bottles of beer.\n" \
      "Take one down and pass it around, 1 bottle of beer on the wall.\n"

  def self.verse(verse)
    case verse
    when 0 then ZERO_BOTTLES_VERSE
    when 1 then ONE_BOTTLE_VERSE
    when 2 then TWO_BOTTLES_VERSE
    else
      "#{verse} bottles of beer on the wall, #{verse} bottles of beer.\n" \
      "Take one down and pass it around, #{verse - 1} bottles of beer on the wall.\n"
    end
  end

  def self.verses(start_verse, end_verse)
    verse_range = (end_verse..start_verse).to_a.reverse
    verse_range.map do |bottle_count|
      verse(bottle_count)
    end.join("\n")
  end

  def self.lyrics
    verses(99, 0)
  end
end
