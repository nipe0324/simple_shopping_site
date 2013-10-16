class CreateOrderDetails < ActiveRecord::Migration
  def change
    create_table :order_details do |t|
      t.integer :product_id
      t.integer :cart_id

      t.timestamps
    end
  end
end
