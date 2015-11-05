class DateRangeIdentifier
  def initialize start_date, end_date
    @start_date = start_date
    @end_date   = end_date
  end

  def call
    if same_year_and_same_day_dates?
      "day_format"
    elsif same_year_and_same_month_dates?
      "month_format"
    elsif same_year_dates?
      "year_format"
    else
      "other_format"
    end
  end

  private 

  attr_reader :start_date, :end_date

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
end