class TimeRangeIdentifier
  def initialize start_time = nil, end_time = nil
    @start_time = start_time
    @end_time   = end_time
  end

  def call
    if has_start_and_end_time?
      "full_time_format"
    elsif has_start_time?   
      "start_time_format"
    elsif has_end_time?   
      "end_time_format"
    end   
  end

  private

  attr_reader :start_time, :end_time

  def has_start_and_end_time?
    start_time && end_time
  end

  def has_start_time?
    start_time
  end

  def has_end_time?
    end_time
  end
end