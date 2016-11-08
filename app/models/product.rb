class Product < ActiveRecord::Base
  validates :name, :description, :client, presence: true
end
