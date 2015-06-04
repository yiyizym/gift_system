class CreateCoins < ActiveRecord::Migration
  def change
    create_table :coins do |t|
      t.integer :face_value, limit: 5
      t.integer :owner
      t.integer :holder
      t.string :description
      t.datetime :publish_date
      t.datetime :transfer_date
      t.datetime :exchange_date

      t.timestamps null: false
    end
  end
end
