require 'test_helper'

class MessageMailerTest < ActionMailer::TestCase
  test "message me" do
  	msg = Message.new(
  		nombre: "cornholio",
  		email: "cornholio@example.com",
  		asunto: "Ole",
  		mensaje: "Mail de prueba Macromet."
  	)

  	email = MessageMailer.message_me(msg).deliver_now

  	refute ActionMailer::Base.deliveries.empty?

  	assert_equal  ["info@macromet.com.co"], email.to
  	assert_equal	["cornholio@example.com"], email.from
  	assert_equal	"Ole", email.subject
    assert_includes email.body.to_s, msg.mensaje
  end
end
