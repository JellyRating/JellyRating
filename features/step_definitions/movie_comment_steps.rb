Then /^(?:|I ) should see my name$/ do
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end


