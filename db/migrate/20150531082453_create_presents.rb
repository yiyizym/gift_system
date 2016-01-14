class CreatePresents < ActiveRecord::Migration
  def change
    create_table :presents do |t|
      t.datetime :transfer_date
      t.integer :from_employee_no
      t.string :from_employee_name
      t.integer :to_employee_no
      t.string :to_employee_name
      t.string :description
      t.integer :coin_num

      t.timestamps null: false
    end
  end
end
