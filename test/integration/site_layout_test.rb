require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path
    assert_select "a[href=?]", portafolio_path, count: 3
    assert_select "a[href=?]", proceso_path, count: 1
    assert_select "a[href=?]", historia_path, count: 2
    assert_select "a[href=?]", contacto_path, count: 2
  end
end
