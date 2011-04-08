class CreatePostulates < ActiveRecord::Migration
  def self.up
    create_table :postulates do |t|
      t.string :uniformLink
      t.string :commentary

      t.timestamps
    end
  end

  def self.down
    drop_table :postulates
  end
end
