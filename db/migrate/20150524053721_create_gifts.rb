class CreateGifts < ActiveRecord::Migration
  def change
    create_table :gifts do |t|
      t.integer :sender_no
      t.integer :reciever_no
      t.integer :point
      t.string :description, limit: 1024
      t.integer :staff_id

      t.timestamps null: false
    end
  end
end
