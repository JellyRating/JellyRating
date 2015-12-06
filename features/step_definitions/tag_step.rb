Given /the following tag exist/ do |tag_table|
  tag_table.hashes.each do |tag|    
    ActsAsTaggableOn::Tag.create(tag)
  end
end