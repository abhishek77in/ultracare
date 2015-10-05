module ApplicationHelper

  def date_range_param_last_month
    start_date = to_date_string(Date.today - 30)
    end_date = to_date_string(Date.today)
    {date_range: "#{start_date} to #{end_date}"}
  end

  private
  def to_date_string(date)
    date.strftime('%d-%m-%Y')
  end
end
