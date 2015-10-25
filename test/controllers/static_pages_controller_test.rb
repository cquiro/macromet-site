require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase

  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "Home | Macromet"
  end

  test "should get portafolio" do
    get :portafolio
    assert_response :success
    assert_select "title", "Portafolio | Macromet"
  end

  test "should get proceso" do
    get :proceso
    assert_response :success
    assert_select "title", "Proceso | Macromet"
  end

  test "should get historia" do
    get :historia
    assert_response :success
    assert_select "title", "Historia | Macromet"
  end

  test "should get contacto" do
    get :contacto
    assert_response :success
    assert_select "title", "Contacto | Macromet"
  end
end
