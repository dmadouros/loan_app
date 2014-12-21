class ItemsListPage < PageObject
  def open
    driver.visit items_path
  end

  def add_item
    driver.click_on 'Add Item'
  end

  def items_names
    driver.all('.items .item-name').map(&:text)
  end
end