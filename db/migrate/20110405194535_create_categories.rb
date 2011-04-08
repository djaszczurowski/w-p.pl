class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.string :polishName
      t.string :polishDescription
      t.string :englishName
      t.string :englishDescription

      t.timestamps
    end
  end

  def self.down
    drop_table :categories
  end
end
