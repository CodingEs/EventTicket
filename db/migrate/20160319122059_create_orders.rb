class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :event_id
      t.string :first_name
      t.string :last_name
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
