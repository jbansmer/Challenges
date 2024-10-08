class Diamond
  def self.make_diamond(letter)
    return "A\n" if letter == 'A'

    all_letters = ('A'..letter).to_a
    middle_letters = ('B'..letter).to_a
    length = (all_letters.length * 2) - 1

    top_half, bottom_half = make_middle(middle_letters, length)
    "#{(top_half + bottom_half).join("\n")}\n"
  end

  def self.make_middle(range, length)
    top_half = [first_line(length)]
    bottom_half = [first_line(length)]
    range.each_with_index do |let, idx|
      space = ' '
      line = "#{let}#{space * idx}#{space}#{space * idx}#{let}".center(length)
      top_half.push line
      break if let == range.last

      bottom_half.unshift line
    end
    return top_half, bottom_half
  end

  def self.first_line(length)
    "A".center(length)
  end
end
