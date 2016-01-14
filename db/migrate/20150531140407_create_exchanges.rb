class CreateExchanges < ActiveRecord::Migration
  def change
    create_table :exchanges do |t|
      t.datetime :exchange_date
      t.integer :holder_no
      t.string :holder_name
      t.integer :coin_num
      t.string :gifts

      t.timestamps null: false
    end
  end
end
