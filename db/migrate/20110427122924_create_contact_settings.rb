class CreateContactSettings < ActiveRecord::Migration
  def self.up
    create_table :contact_settings do |t|
      t.string :email

      t.timestamps
    end
  end

  def self.down
    drop_table :contact_settings
  end
end
