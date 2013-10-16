class AddRoleToUsers < ActiveRecord::Migration
  def change
  	 # The status of order includes "user", "admin"
    add_column :users, :role, :string, :null => false, :default => "user"
  end
end
