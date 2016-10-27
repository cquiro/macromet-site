class Banner < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  validates :name, :title, :subtitle, :button, presence: true
end
