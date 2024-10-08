# frozen_string_literal: true

# top-level comment to satisfy Rubocop
class Robot
  attr_reader :name

  @@chosen_names = []

  def self.chosen_names
    @@chosen_names
  end

  def initialize
    reset
  end

  def reset
    @@chosen_names.delete @name if @name
    loop do
      @name = assign_name
      break unless @@chosen_names.include? @name
    end
    @@chosen_names << @name
  end

  private

  def assign_name
    letters = ('A'..'Z').to_a
    new_name = ''
    2.times { |_| new_name += letters[rand(26)].to_s }
    3.times { |_| new_name += rand(10).to_s }
    new_name
  end
end
