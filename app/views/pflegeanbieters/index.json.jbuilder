json.array!(@pflegeanbieters) do |pflegeanbieter|
  json.extract! pflegeanbieter, :name, :bewertung
  json.url pflegeanbieter_url(pflegeanbieter, format: :json)
end
