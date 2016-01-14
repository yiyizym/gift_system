class SetDefaultFaceValueOfCoins < ActiveRecord::Migration
  def change
  	change_column_default :coins, :face_value, 10
  end
end
