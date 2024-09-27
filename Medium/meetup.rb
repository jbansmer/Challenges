# frozen_string_literal: true

require 'date'

# top-level comment to satisfy Rubocop
class Meetup
  ORDINALS = {
    'first' => 1,
    'second' => 2,
    'third' => 3,
    'fourth' => 4,
    'fifth' => 5
  }

  def initialize(year, month, day = 1)
    @year = year
    @month = month
    @day = day
  end

  def day(day_of_week, freq_indicator)
    if ORDINALS.keys.include? freq_indicator.downcase
      first_to_fifth(day_of_week, freq_indicator)
    elsif freq_indicator.downcase == 'teenth'
      teenth(day_of_week)
    else
      last(day_of_week)
    end
  end

  def first_to_fifth(day_of_week, freq_indicator)
    meetup_date = Date.civil(@year, @month, @day)
    counter = 0
    loop do
      counter += 1 if reqd_day?(day_of_week, meetup_date)
      return meetup_date if counter == ORDINALS[freq_indicator.downcase]
      meetup_date = meetup_date.next_day
      return nil if meetup_date.month != @month
    end
    meetup_date
  end

  def teenth(day_of_week)
    meetup_date = Date.civil(@year, @month, 13)
    meetup_date = meetup_date.next_day until reqd_day?(day_of_week, meetup_date)
    meetup_date
  end

  def last(day_of_week)
    meetup_date = Date.civil(@year, @month, @day).next_month.prev_day
    meetup_date = meetup_date.prev_day until reqd_day?(day_of_week, meetup_date)
    meetup_date
  end

  def reqd_day?(day, date)
    days = ['sunday', 'monday', 'tuesday', 'wednesday', 'thursday', 'friday',
            'saturday', 'sunday']
    days[date.wday] == day.downcase
  end
end
