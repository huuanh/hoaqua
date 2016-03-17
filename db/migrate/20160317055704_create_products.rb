class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :price
      t.string :name, null:false
      t.string :description
      t.string :make
      t.string :img_link

      t.timestamps null: false
    end
  end
end
