Given /the following item exist/ do |item_table|
  item_table.hashes.each do |item|    
    Item.create(item)
  end
end

And /I am on the "(.*)" item page$/ do |item_title|
  item = Item.find_by(title: item_title)
  visit item_path(item.id)
end