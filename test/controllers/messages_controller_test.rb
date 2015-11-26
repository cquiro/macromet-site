require 'test_helper'

class MessagesControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "succesfull post" do
  	post :create, message: {
  		nombre: "cornholio",
  		email: "cornholio@example.com",
  		asunto: "hi",
  		mensaje: "bai"
  	}

  	assert_redirected_to new_message_path
  end

  test "failed post" do
  	post :create, message: {
  		nombre: '',
  		email: '',
  		asunto: '',
  		mensaje: ''
  	}

  	[:nombre, :email, :asunto, :mensaje].each do |attr|
  		assert_select 'li', "#{attr.capitalize} can't be blank"
  	end
  end
end
