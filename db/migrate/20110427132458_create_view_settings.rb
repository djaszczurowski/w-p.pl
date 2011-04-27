class CreateViewSettings < ActiveRecord::Migration
  def self.up
    create_table :view_settings do |t|
      #t.integer :view_setting_id
      t.integer :news_per_page
      t.integer :comments_per_page
      t.integer :postulates_per_page
      t.integer :users_per_page
      t.integer :date_length
      t.integer :news_length
      t.integer :news_on_main      
	  t.integer :categories_per_page
      
      t.timestamps
    end
  end

  def self.down
    drop_table :view_settings
  end
end
