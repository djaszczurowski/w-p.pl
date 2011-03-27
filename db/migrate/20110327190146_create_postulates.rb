class CreatePostulates < ActiveRecord::Migration
  def self.up
    create_table :postulates do |t|
      t.integer :user_id
      t.string :uniform_link
      t.string :commentary

      t.timestamps
    end
  end

  def self.down
    drop_table :postulates
  end
end
