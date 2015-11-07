json.array!(@commentaries) do |commentary|
  json.extract! commentary, :id
  json.url commentary_url(commentary, format: :json)
end
