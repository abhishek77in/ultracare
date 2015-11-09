json.array!(@templates) do |template|
  json.extract! template, :id, :report_title, :content
  json.url template_url(template, format: :json)
end
