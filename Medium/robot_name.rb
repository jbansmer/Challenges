# frozen_string_literal: true

# top-level comment to satisfy Rubocop
class Robot
  attr_reader :name

  @@chosen_names = []

  def initialize
    reset
    @@chosen_names << @name
  end

  def reset
    loop do
      @name = assign_name
      break unless @@chosen_names.include? @name
    end
  end

  private

  def assign_name
    letters = ('A'..'Z').to_a
    "#{letters[rand(26)]}#{letters[rand(26)]}#{rand(10)}#{rand(10)}#{rand(10)}"
  end
end
