class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.string :polish_name
      t.string :polish_description
      t.string :english_name
      t.string :english_description

      t.timestamps
    end
  end

  def self.down
    drop_table :categories
  end
end
