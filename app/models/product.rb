class Product < ActiveRecord::Base
  validates :name, :description, :client, :type, presence: true
end
