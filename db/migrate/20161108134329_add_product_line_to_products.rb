class AddProductLineToProducts < ActiveRecord::Migration
  def change
    add_column :products, :product_line, :string
  end
end
