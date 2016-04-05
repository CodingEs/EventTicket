class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :event_location_id
      t.string :name
      t.text :description
      t.decimal :ticket_price, precision: 8, scale: 2

      t.timestamps null: false
    end
  end
end
