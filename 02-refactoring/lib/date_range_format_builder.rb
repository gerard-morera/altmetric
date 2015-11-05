class DateRangeFormatBuilder
  def initialize start_date, end_date, start_time = nil, end_time = nil
    @start_date = start_date
    @end_date   = end_date
    @start_time = start_time
    @end_time   = end_time
  end

  def full_date time_range
    if time_range == "full_time_format"
      "#{full_start_date} at #{start_time} - #{full_end_date} at #{end_time}" 
    elsif time_range == "start_time_format" 
      "#{full_start_date} at #{start_time} - #{full_end_date}" 
    elsif time_range == "end_time_format"   
      "#{full_start_date} - #{full_end_date} at #{end_time}" 
    end       
  end

  def partial_date time_range
    if time_range == "full_time_format" 
      "#{full_start_date} at #{start_time} to #{end_time}"
    elsif time_range == "start_time_format" 
      "#{full_start_date} at #{start_time}"
    elsif time_range == "end_time_format"   
      "#{full_start_date} until #{end_time}"
    end
  end

  def without_time date_range
    if date_range == "month_format" 
      start_day + full_end_date
    elsif date_range == "year_format"
      start_date_with_month + full_end_date
    elsif date_range == "other_format"
      "#{full_start_date} - #{full_end_date}"
    else
      full_start_date
    end
  end

  private 

  attr_reader :start_date, :end_date, :start_time, :end_time

  def full_start_date
    start_date.strftime("#{start_date.day.ordinalize} %B %Y")
  end

  def full_end_date
    end_date.strftime("#{end_date.day.ordinalize} %B %Y")
  end

  def start_day
    start_date.strftime("#{start_date.day.ordinalize} - ")
  end

  def start_date_with_month
    start_date.strftime("#{start_date.day.ordinalize} %B - ")
  end
end