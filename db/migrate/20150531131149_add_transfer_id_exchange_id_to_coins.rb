class AddTransferIdExchangeIdToCoins < ActiveRecord::Migration
  def change
  	add_column :coins, :transfer_id, :integer
  	add_column :coins, :exchange_id, :integer
  end
end
