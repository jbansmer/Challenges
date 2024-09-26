# frozen_string_literal: true

# top-level comment to satisfy Rubocop
class Clock
  def self.at(hour = 0, minute = 0)
    Clock.new(hour, minute)
  end

  def initialize(hour, minute)
    @hour = hour
    @minute = minute
  end

  def +(minutes)
    Clock.new(@hour, (@minute + minutes))
  end

  def -(minutes)
    Clock.new(@hour, (@minute - minutes))
  end

  def ==(other)
    adjust_time
    other.adjust_time
    hour == other.hour && minute == other.minute
  end

  def to_s
    adjust_time
    hour = @hour < 10 ? "0#{@hour}" : @hour.to_s
    minute = @minute < 10 ? "0#{@minute}" : @minute.to_s
    "#{hour}:#{minute}"
  end

  protected

  attr_reader :hour, :minute

  def adjust_minutes
    loop do
      break if @minute < 60

      @minute -= 60
      @hour += 1
    end
    loop do
      break if @minute >= 0

      @minute += 60
      @hour -= 1
    end
  end

  def adjust_hours
    loop do
      break if @hour < 24

      @hour -= 24
    end
    loop do
      break if @hour >= 0

      @hour += 24
    end
  end

  def adjust_time
    adjust_minutes
    adjust_hours
  end
end
