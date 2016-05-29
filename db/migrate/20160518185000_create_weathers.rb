class CreateWeathers < ActiveRecord::Migration
  def change
    create_table :weathers do |t|
      t.integer :city_id
      t.datetime :time
      t.float :current_temperature
      t.float :pressure
      t.float :humidity
      t.float :wind_speed
      t.float :wind_direction
      t.float :cloudiness
      t.string :description
      t.string :icon
      t.timestamps null: false
    end
  end
end
