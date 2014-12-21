class TestApplication
  def initialize(driver)
    @driver = driver
  end

  def dashboard_page
    @dashboard_page ||= HomePage.new(driver)
  end

  def primary_navigation
    @primary_navigation ||= PrimaryNavigationSection.new(driver)
  end

  def login_page
    @login_page ||= LoginPage.new(driver)
  end

  def add_item_page
    @add_item_page ||= AddItemPage.new(driver)
  end

  def visit_dashboard
    dashboard_page.open
  end

  def my_items_page
    @my_items_page ||= ItemsListPage.new(driver)
  end

  def add_item(name:)
    add_item_page.name = name
    add_item_page.createItem
  end

  def login_with_credentials(email:, password:)
    login_page.email = email
    login_page.password = password
    login_page.login
  end

  def list_my_items
    primary_navigation.listMyItems
  end

  private

  attr_reader :driver
end