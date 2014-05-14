module ApplicationHelper

  def convert_to_line_break(text)
    text.gsub(/(?:\n\r?|\r\n?)/, '<br>')
  end
end
