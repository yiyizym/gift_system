class ChangeOwnerHolderOfCoins < ActiveRecord::Migration
  def change
  	change_table :coins do |t|
  		t.change :owner, :integer
  		t.change :holder, :integer
  	end
  end
end
