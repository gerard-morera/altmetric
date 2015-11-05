require_relative 'time_range_identifier.rb'
require_relative 'date_range_identifier.rb'
require_relative 'date_range_format_builder.rb'
require "date"
require "fixnum"
require 'pry'

class DateRangeFormatter
  def initialize start_date, end_date, start_time = nil, end_time = nil
    @start_date = Date.parse(start_date)
    @end_date   = Date.parse(end_date)
    @start_time = start_time
    @end_time   = end_time
  end

  def to_s
    if time_range
      get_format_with_time_range
    else
      format_builder.without_time(date_range)
    end
  end

  private

  attr_reader :start_date, :start_time, :end_date, :end_time, :date_range, :time_range

  def get_format_with_time_range
    if has_end_date_to_display?
      format_builder.full_date(time_range)
    else
      format_builder.partial_date(time_range)
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

  def format_builder
    format_builder = DateRangeFormatBuilder.new(start_date, end_date, start_time, end_time)
  end

  def date_range
    date_range ||= DateRangeIdentifier.new(start_date, end_date).call
  end

  def time_range
    time_range ||= TimeRangeIdentifier.new(start_time, end_time).call
  end
end

