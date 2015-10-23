json.array!(report_types) do |template|
  json.extract! template, :id, :title, :content
  json.url template_url(template, format: :json)
end
