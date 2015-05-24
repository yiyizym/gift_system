class AddPhoneToStaffs < ActiveRecord::Migration
  def change
  	add_column :staffs, :phone, :string, limit: 11
  end
end
