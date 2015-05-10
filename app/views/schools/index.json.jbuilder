json.array!(@schools) do |school|
  json.extract! school, :id, :name, :scholarship, :rating
  json.url school_url(school, format: :json)
end
