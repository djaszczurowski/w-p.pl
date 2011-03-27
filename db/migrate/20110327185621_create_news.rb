class CreateNews < ActiveRecord::Migration
  def self.up
    create_table :news do |t|
      t.integer :user_id
      t.datetime :posted
      t.integer :category_id
      t.string :polish_subject
      t.string :polish_news
      t.string :english_subject
      t.string :english_news

      t.timestamps
    end
  end

  def self.down
    drop_table :news
  end
end
