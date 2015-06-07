class AddPublishIdToCoins < ActiveRecord::Migration
  def change
  	add_column :coins, :publish_id, :integer
  end
end
