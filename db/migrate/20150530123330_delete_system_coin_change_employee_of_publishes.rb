class DeleteSystemCoinChangeEmployeeOfPublishes < ActiveRecord::Migration
  def change
  	remove_column :publishes , :system_name, :string
  	remove_column :publishes , :system_id, :integer
  	remove_column :publishes , :coin_id, :integer
  	rename_column :publishes , :employee_id, :employee_no
  end
end
