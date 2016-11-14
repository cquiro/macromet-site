class Product < ActiveRecord::Base
  mount_uploader :photo, ImageUploader
  validates :name, :description, :client, :product_line, presence: true
end
