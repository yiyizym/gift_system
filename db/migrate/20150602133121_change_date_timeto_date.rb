class ChangeDateTimetoDate < ActiveRecord::Migration
  def change
  	change_table :coins do |c|
  		c.change :publish_date , :date
  		c.change :transfer_date , :date
  		c.change :exchange_date , :date
  	end

  	change_table :exchanges do |e|
  		e.change :exchange_date, :date
  	end

  	change_table :publishes do |p|
  		p.change :publish_date, :date
  	end

  	change_table :presents do |p|
  		p.change :transfer_date, :date
  	end

  end
end
