class Message
	include ActiveModel::Model
	attr_accessor :nombre, :email, :asunto, :mensaje
	validates :nombre, :email, :asunto, :mensaje, presence: true
end
