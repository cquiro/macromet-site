class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.string :title
      t.string :subtitle
      t.string :button
      t.string :image

      t.timestamps null: false
    end
  end
end
