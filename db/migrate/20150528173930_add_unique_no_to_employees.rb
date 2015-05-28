class AddUniqueNoToEmployees < ActiveRecord::Migration
	def change
		change_table :employees do |t|
			t.change :no, :integer, :unique => true
		end
	end
end
