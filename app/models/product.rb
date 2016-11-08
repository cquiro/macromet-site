class Product < ActiveRecord::Base
  validates :name, :description, :client, :product_line, presence: true
end
