class DateRangeFormatBuilder
  def initialize start_date, end_date, start_time = nil, end_time = nil, date_range, time_range
    @start_date = start_date
    @end_date   = end_date
    @start_time = start_time
    @end_time   = end_time
    @date_range = date_range
    @time_range = time_range
  end

  def full_date
    if time_range == "full_time_format"
      "#{full_start_date} at #{start_time} - #{full_end_date} at #{end_time}" 
    elsif time_range == "start_time_format" 
      "#{full_start_date} at #{start_time} - #{full_end_date}" 
    elsif time_range == "end_time_format"   
      "#{full_start_date} - #{full_end_date} at #{end_time}" 
    end       
  end

  def partial_date
    if time_range == "full_time_format"
      "#{full_start_date} at #{start_time} to #{end_time}"
    elsif time_range == "start_time_format" 
      "#{full_start_date} at #{start_time}"
    elsif time_range == "end_time_format"   
      "#{full_start_date} until #{end_time}"
    end
  end

  def without_time
    if date_range == "month_format" 
      start_date.strftime("#{start_date.day.ordinalize} - ") + full_end_date
    elsif date_range == "year_format"
      start_date.strftime("#{start_date.day.ordinalize} %B - ") + full_end_date
    elsif date_range == "other_format"
      "#{full_start_date} - #{full_end_date}"
    else
      full_start_date
    end
  end

  private 

  attr_reader :start_date, :end_date, :start_time, :end_time, :date_range, :time_range
  
  def full_start_date
    start_date.strftime("#{start_date.day.ordinalize} %B %Y")
  end

  def full_end_date
    end_date.strftime("#{end_date.day.ordinalize} %B %Y")
  end
end