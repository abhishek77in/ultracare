module ApplicationHelper

  def convert_to_line_break(text)
    return "" if text.blank?
    text.gsub(/(?:\n\r?|\r\n?)/, '<br>')
  end

end
