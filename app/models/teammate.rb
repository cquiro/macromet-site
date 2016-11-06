class Teammate < ActiveRecord::Base
  mount_uploader :photo, ImageUploader
  validates :name, :position, presence: true
end
