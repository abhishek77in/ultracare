json.array!(@templates) do |template|
  json.extract! template, :id, :title, :content
  json.url template_url(template, format: :json)
end
