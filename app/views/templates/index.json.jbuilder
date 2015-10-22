json.array!(@templates) do |template|
  json.extract! template, :id, :ultrasound_type, :content
  json.url template_url(template, format: :json)
end
