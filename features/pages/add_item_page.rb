class AddItemPage < PageObject
  def name=(name)
    driver.fill_in 'Name', with: name
  end

  def createItem
    driver.click_on 'Create'
  end

  def has_error?
    driver.has_content?("Name can't be blank")
  end
end