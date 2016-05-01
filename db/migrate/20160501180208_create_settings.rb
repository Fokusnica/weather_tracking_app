class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.integer :user_id
      t.boolean :notifications
      t.timestamps null: false
    end
  end
end
