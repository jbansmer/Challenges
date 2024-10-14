class Clock
  MINS_PER_HOUR = 60
  HOURS_PER_DAY = 24

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
    until minutes < MINS_PER_HOUR
      self.minutes -= MINS_PER_HOUR
      self.hours += 1
    end

    until hours < HOURS_PER_DAY
      self.hours -= HOURS_PER_DAY
    end

    self
  end

  def sub_reformat
    until minutes >= 0
      self.minutes += MINS_PER_HOUR
      self.hours -= 1
    end

    until hours >= 0
      self.hours += HOURS_PER_DAY
    end

    self
  end
end
