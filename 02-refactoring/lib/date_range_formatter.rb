require_relative 'date_range_identifier.rb'
require_relative 'time_range_identifier.rb'
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
    date_range = DateRangeIdentifier.new(start_date, end_date).call
    get_format_for date_range
  end

  private

  attr_reader :start_date, :start_time, :end_date, :end_time

  def has_time?
    start_time || end_time
  end

  def get_format_for date_range
    time_range = TimeRangeIdentifier.new(start_time, end_time).call

    if time_range
      get_format_with time_range
    else
     get_format_without_time_range date_range
    end
  end

  def get_format_without_time_range date_range
    if date_range == "month" 
      start_date.strftime("#{start_date.day.ordinalize} - ") + end_date.strftime("#{end_date.day.ordinalize} %B %Y")
    elsif date_range == "year"
      start_date.strftime("#{start_date.day.ordinalize} %B - ") + end_date.strftime("#{end_date.day.ordinalize} %B %Y")
    elsif date_range == "other"
      "#{full_start_date} - #{full_end_date}"
    else
      full_start_date
    end
  end

  def get_format_with time_range
    if time_range == "full_time_format"
      has_end_date_to_display? ? "#{full_start_date} at #{start_time} - #{full_end_date} at #{end_time}" : "#{full_start_date} at #{start_time} to #{end_time}"
    elsif time_range == "start_time_format" 
      has_end_date_to_display? ? "#{full_start_date} at #{start_time} - #{full_end_date}" : "#{full_start_date} at #{start_time}"
    elsif time_range == "end_time_format"   
      has_end_date_to_display? ? "#{full_start_date} - #{full_end_date} at #{end_time}" : "#{full_start_date} until #{end_time}"
    end   
  end

  def has_end_date_to_display?
    if same_year_and_same_day_dates?
      false
    else
      end_date
    end 
  end

  def same_year_and_same_day_dates?
    start_date == end_date
  end


  

  def full_start_date
    start_date.strftime("#{start_date.day.ordinalize} %B %Y")
  end

  def full_end_date
    end_date.strftime("#{end_date.day.ordinalize} %B %Y")
  end
end

