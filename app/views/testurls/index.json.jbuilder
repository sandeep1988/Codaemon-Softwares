json.array!(@testurls) do |testurl|
  json.extract! testurl, :id, :name
  json.url testurl_url(testurl, format: :json)
end
