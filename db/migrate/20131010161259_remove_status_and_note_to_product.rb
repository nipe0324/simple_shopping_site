class RemoveStatusAndNoteToProduct < ActiveRecord::Migration
  def up
  	remove_column :products, :note
  	remove_column :products, :status
  end

  def down
  	add_column :products, :note, :text
  	add_column :products, :status, :string
	end
end
