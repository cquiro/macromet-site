class Teammate < ActiveRecord::Base
  validates :name, :position, :photo, presence: true
end
