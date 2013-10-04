class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :image_url
      t.text :note
      t.decimal :price
#      t.column :status, "ENUM('contributed', 'sent', 'registered', 'sold', 'finished', 'returned', 'declined', 'descarded')"
      t.string :status

      t.timestamps
    end
  end
end
