require 'Date'

class Meetup
  FREQ = {
    'first' => 1,
    'second' => 2,
    'third' => 3,
    'fourth' => 4,
    'fifth' => 5
  }
  DAYS = %w(sunday monday tuesday wednesday thursday friday saturday)

  def initialize(year, month)
    @date = Date.new(year, month)
    @month = month
  end

  def day(weekday, freq_indicator)
    day_target = DAYS.index(weekday.downcase)

    case freq_indicator.downcase
    when 'last' then last(day_target)
    when 'teenth' then teenth(day_target)
    else
      first_to_fifth(day_target, freq_indicator.downcase)
    end
  end

  def last(day_target)
    @date = @date.next_month.prev_day
    @date = @date.prev_day until @date.wday == day_target
    @date
  end

  def teenth(day_target)
    @date += 12
    @date = @date.next_day until @date.wday == day_target
    @date
  end

  def first_to_fifth(day_target, freq)
    freq_target = FREQ[freq]
    counter = 0
    loop do
      counter += 1 if @date.wday == day_target
      break if freq_target == counter

      @date = @date.next_day
      return nil if @date.month != @month
    end
    @date
  end
end
