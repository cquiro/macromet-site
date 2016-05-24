class Banner < ActiveRecord::Base
  validates :name, :title, :subtitle, :button, :image, presence: true

  
end
