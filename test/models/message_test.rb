require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  test "responds to name, email, subject and content" do
  	msg = Message.new
		[:name, :email, :subject, :content].each do |attr|
			assert msg.respond_to? attr
		end
  end

  test "should accept valid attributes" do
  	valid_attrs = {
  		name: "Pepe",
  		email: "pepe@cortisona.com",
  		subject: "Ole, ole!",
  		content: "Hola. Han visto a Condorito?"
  	}

  	msg = Message.new valid_attrs

  	assert msg.valid?
  end

  test "attributes can not be blank" do
  	msg = Message.new
  	refute msg.valid?
  end
end







