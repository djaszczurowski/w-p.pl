class CreateNews < ActiveRecord::Migration
  def self.up
    create_table :news do |t|
      t.date :posted
      t.string :polishSubject
      t.string :polishNews
      t.string :englishSubject
      t.string :englishNews

      t.timestamps
    end
  end

  def self.down
    drop_table :news
  end
end
