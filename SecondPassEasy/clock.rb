class Clock
  def initialize(hours, minutes)
    @hours = hours
    @minutes = minutes
  end

  def self.at(hours, minutes = 0)
    Clock.new(hours, minutes)
  end

  def +(more_mins)
    new_minutes = minutes + more_mins
    Clock.at(hours, new_minutes).add_reformat
  end

  def -(less_mins)
    new_minutes = minutes - less_mins
    Clock.at(hours, new_minutes).sub_reformat
  end

  def ==(other)
    hours == other.hours && minutes == other.minutes
  end

  # orignal solution had 'sprintf' instead of 'format'
  # 'format' used to satisfy rubocop
  def to_s
    self.hours = hours < 10 ? format('0%d', hours) : hours
    self.minutes = minutes < 10 ? format('0%d', minutes) : minutes
    "#{hours}:#{minutes}"
  end

  protected

  attr_accessor :hours, :minutes

  def add_reformat
    until minutes < 60
      self.minutes -= 60
      self.hours += 1
    end

    until hours < 24
      self.hours -= 24
    end

    self
  end

  def sub_reformat
    until minutes >= 0
      self.minutes += 60
      self.hours -= 1
    end

    until hours >= 0
      self.hours += 24
    end

    self
  end
end
