class AddAttachmentFoodpicToPosts < ActiveRecord::Migration
  def self.up
    change_table :posts do |t|
      t.has_attached_file :foodpic
    end
  end

  def self.down
    drop_attached_file :posts, :foodpic
  end
end
