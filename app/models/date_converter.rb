module DateConverter
  def to_range(date_range)
    date_range = date_range.split(' to ')
    start_date = to_date(date_range.first)
    end_date = to_date(date_range.last) + 1
    start_date..end_date
  end

  def to_date(date_string)
    Date.strptime(date_string, '%d-%m-%Y')
  end

  def to_string(date_range)
    start_date = date_range.first.strftime('%d-%m-%Y')
    end_date = (date_range.last - 1).strftime('%d-%m-%Y')
    "#{start_date} to #{end_date}"
  end
end
