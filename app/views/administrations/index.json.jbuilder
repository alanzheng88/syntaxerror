json.array!(@administrations) do |administration|
  json.extract! administration, :id
  json.url administration_url(administration, format: :json)
end
