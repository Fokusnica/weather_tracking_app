class AddUserIdToCity < ActiveRecord::Migration
  def change
    remove_column :cities, :setting_id
    add_column :cities, :user_id, :integer
  end
end
