class AddCoinPublishdateToPublishes < ActiveRecord::Migration
  def change
  	add_column :publishes, :coin_num, :integer
  	add_column :publishes, :publish_date, :datetime
  end
end
