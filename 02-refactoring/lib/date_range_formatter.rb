require "date"
require "fixnum"
require 'pry'

class DateRangeFormatter
  def initialize(start_date, end_date, start_time = nil, end_time = nil)
    @start_date = Date.parse(start_date)
    @end_date   = Date.parse(end_date)
    @start_time = start_time
    @end_time   = end_time
  end

  def to_s
    if same_year_and_same_day_dates?
      get_day_range
    elsif same_year_and_same_month_dates?
      get_month_range
    elsif same_year_dates?
      get_year_range
    else
      get_other_range
    end
  end

  private

  attr_reader :start_date, :start_time, :end_date, :end_time

  def get_day_range
    if has_start_and_end_time?
      "#{full_start_date} at #{start_time} to #{end_time}"
    elsif has_start_time?
      "#{full_start_date} at #{start_time}"
    elsif has_end_time?
      "#{full_start_date} until #{end_time}"
    else
      full_start_date
    end
  end

  def get_month_range
    if has_start_and_end_time?
      "#{full_start_date} at #{start_time} - #{full_end_date} at #{end_time}"
    elsif has_start_time?
      "#{full_start_date} at #{start_time} - #{full_end_date}"
    elsif has_end_time?
      "#{full_start_date} - #{full_end_date} at #{end_time}"
    else
      start_date.strftime("#{start_date.day.ordinalize} - #{end_date.day.ordinalize} %B %Y")
    end
  end

  def get_year_range
    if has_start_and_end_time?
      "#{full_start_date} at #{start_time} - #{full_end_date} at #{end_time}"
    elsif has_start_time?
      "#{full_start_date} at #{start_time} - #{full_end_date}"
    elsif has_end_time?
      "#{full_start_date} - #{full_end_date} at #{end_time}"
    else
      start_date.strftime("#{start_date.day.ordinalize} %B - ") + @end_date.strftime("#{@end_date.day.ordinalize} %B %Y")
    end
  end

  def get_other_range

    if has_start_and_end_time?
      "#{full_start_date} at #{start_time} - #{full_end_date} at #{end_time}"
    elsif has_start_time?
      "#{full_start_date} at #{start_time} - #{full_end_date}"
    elsif has_end_time?
      "#{full_start_date} - #{full_end_date} at #{end_time}"
    else
      "#{full_start_date} - #{full_end_date}"
    end
  end

  def has_start_and_end_time?
    start_time && end_time
  end

  def has_start_time?
    start_time
  end

  def has_end_time?
    end_time
  end

  def same_year_and_same_day_dates?
    start_date == end_date
  end

  def same_year_and_same_month_dates?
    same_month_dates? && same_year_dates?
  end

  def same_month_dates?
    start_date.month == end_date.month
  end

  def same_year_dates?
    start_date.year == end_date.year
  end

  def full_start_date
    start_date.strftime("#{start_date.day.ordinalize} %B %Y")
  end

  def full_end_date
    end_date.strftime("#{end_date.day.ordinalize} %B %Y")
  end
end

