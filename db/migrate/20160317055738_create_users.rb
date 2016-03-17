class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, null: false, default: ''
      t.string :password_digest, null: false, default: ''
      t.string :username, null: false, default: ''
    end
    add_index :users, :email, unique: true
    add_index :users, :username, unique: true
  end
end
