class ChangeOwnerHolderOfCoins < ActiveRecord::Migration
  def change
  	change_column :coins, :owner, 'integer USING CAST("owner" AS integer)'
  	change_column :coins, :holder, 'integer USING CAST("holder" AS integer)'
  end
end
