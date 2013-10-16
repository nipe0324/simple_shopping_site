class AddStatusToOrder < ActiveRecord::Migration
  def change
  	# The status of order includes "received", "canceled", shipped", "returned"
    add_column :orders, :status, :string, :null => false, :default => "received"
  end
end
