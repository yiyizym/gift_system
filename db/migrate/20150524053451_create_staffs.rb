class CreateStaffs < ActiveRecord::Migration
  def change
    create_table :staffs do |t|
      t.integer :no
      t.string :name, limit: 32
      t.integer :point
      t.string :gender, limit: 1
      t.string :description, limit: 1024

      t.timestamps null: false
    end
    add_index :staffs, :no, unique: true
  end
end
