class CreateEventLocations < ActiveRecord::Migration
  def change
    create_table :event_locations do |t|
      t.string :name
      t.text :description
      t.integer :available_seats

      t.timestamps null: false
    end
  end
end
