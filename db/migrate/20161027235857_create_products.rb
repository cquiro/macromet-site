class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.string :client
      t.string :photo

      t.timestamps null: false
    end
  end
end
