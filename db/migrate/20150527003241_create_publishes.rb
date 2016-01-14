class CreatePublishes < ActiveRecord::Migration
  def change
    create_table :publishes do |t|
      t.string :system_name
      t.string :employee_name
      t.integer :coin_id
      t.integer :system_id
      t.integer :employee_id

      t.timestamps null: false
    end
  end
end
