class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, null: false, default: ''
      t.string :password_digest, null: false, default: ''
      t.string :username, null: false, default: ''
      t.boolean :visible, default: true
      t.boolean :admin, default: false
    end
    add_index :users, :email, unique: true
    add_index :users, :username, unique: true
  end
end
