class AddNameToBanners < ActiveRecord::Migration
  def change
    add_column :banners, :name, :string
  end
end
