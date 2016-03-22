class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.references :user, index: true, foreign_key: true, null: false
      t.references :product, index: true, foreign_key: true, null: false
      t.integer :number, default: 0

      t.timestamps null: false
    end
  end
end
