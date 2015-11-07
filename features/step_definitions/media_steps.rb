Given /the following media exist/ do |media_table|
  media_table.hashes.each do |media|    
    Media.create(media)
  end
end

And /I am on the "(.*)" media page$/ do |media_title|
  media = Media.find_by(title: media_title.downcase)
  visit medium_path(media.id)
end