json.array!(@media_avaliations) do |media_avaliation|
  json.extract! media_avaliation, :id, :media, :user, :rating
  json.url media_avaliation_url(media_avaliation, format: :json)
end
