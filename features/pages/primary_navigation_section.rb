class PrimaryNavigationSection < PageObject
  def listMyItems
    driver.click_on 'My Items'
  end

  def user_name
    driver.first('.user_name').try(:text)
  end

  def has_log_out_button?
    driver.has_link?('Log out')
  end

  def log_out
    driver.click_link 'Log out'
  end
end