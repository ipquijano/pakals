class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.integer :user_id
      t.text :town_from
      t.integer :spam_status
      t.string :tag

      t.timestamps
    end
  end
end
