class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :usertype
      t.string :name
      t.date :birthdate
      t.string :email
      t.integer :contact_num
      t.integer :reputation
      t.string :address
      t.string :tag
      t.string :password_hash
      t.string :password_salt

      t.timestamps
    end
  end
end
