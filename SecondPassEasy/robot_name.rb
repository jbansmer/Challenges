class Robot
  LETTERS = ('A'..'Z').to_a.freeze
  NUMBERS = ('0'..'9').to_a.freeze

  @@all_names = []

  attr_reader :name

  def initialize
    new_name
  end

  def reset
    @@all_names.delete(name)
    new_name
  end

  private

  def new_name
    name = ''
    loop do
      name = ''
      2.times { name += random_letter }
      3.times { name += random_number }
      break unless @@all_names.include? name
    end
    @@all_names << name
    @name = name
  end

  def random_letter
    LETTERS.sample
  end

  def random_number
    NUMBERS.sample
  end
end
