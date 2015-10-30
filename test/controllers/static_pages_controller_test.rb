require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase

  def setup
    @base_title = "Macromet"
  end

  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "#{@base_title}"
  end

  test "should get portafolio" do
    get :portafolio
    assert_response :success
    assert_select "title", "Portafolio | #{@base_title}"
  end

  test "should get proceso" do
    get :proceso
    assert_response :success
    assert_select "title", "Proceso | #{@base_title}"
  end

  test "should get historia" do
    get :historia
    assert_response :success
    assert_select "title", "Historia | #{@base_title}"
  end

  test "should get contacto" do
    get :contacto
    assert_response :success
    assert_select "title", "Contacto | #{@base_title}"
  end
end
