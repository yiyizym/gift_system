class AddColumnsToEmployees < ActiveRecord::Migration
  def change
  	add_column :employees, :own_coins, :integer
  	add_column :employees, :get_coins, :integer

  end
end
