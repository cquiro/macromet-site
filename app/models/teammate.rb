class Teammate < ActiveRecord::Base
  mount_uploader :photo, ImageUploader
  validates :name, :position, :photo, presence: true
end
