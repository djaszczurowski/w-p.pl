class CreateCommentaries < ActiveRecord::Migration
  def self.up
    create_table :commentaries do |t|
      t.integer :user_id
      t.integer :news_id
      t.date :posted
      t.string :subject
      t.string :comment

      t.timestamps
    end
  end

  def self.down
    drop_table :commentaries
  end
end
