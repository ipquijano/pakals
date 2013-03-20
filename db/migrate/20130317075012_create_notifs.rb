class CreateNotifs < ActiveRecord::Migration
  def change
    create_table :notifs do |t|
      t.integer :recipient_id
      t.integer :sender_id
      t.string :notif_body
      t.boolean :read_at

      t.timestamps
    end
  end
end
