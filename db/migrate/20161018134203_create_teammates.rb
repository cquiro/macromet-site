class CreateTeammates < ActiveRecord::Migration
  def change
    create_table :teammates do |t|
      t.string :name
      t.string :position
      t.text :bio
      t.string :photo

      t.timestamps null: false
    end
  end
end
