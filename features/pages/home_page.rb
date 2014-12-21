class HomePage < PageObject
  def open
    driver.visit root_path
  end

  def notifications
    driver.all('.alert-box.success').map(&:text)
  end

  def dashboard_page?
    driver.has_content? 'Hey there'
  end
end