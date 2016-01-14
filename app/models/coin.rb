class Coin < ActiveRecord::Base
	validates_presence_of :owner, :publish_id


	def self.create_coins(owner, publish_id, num)
		num.times do
			self.create(owner: owner, publish_id: publish_id)
		end
	end


	def self.update_coins(owner, publish_id, num)
		self.destroy_coins(publish_id)
		self.create_coins(owner, publish_id, num)
	end

	def self.destroy_coins(publish_id)
		self.where(publish_id: publish_id).destroy_all
	end

	def self.add_transfer(transfer_id, from_employee_no, to_employee_no, transfer_date, coin_num)
		raise "you cannot transfer coins more than you have" if self.where({owner: from_employee_no, transfer_id: nil}).count < coin_num
		coin_num.times do
			coin = self.where({owner: from_employee_no, transfer_date: nil}).take!
			coin.transfer_date = transfer_date
			coin.holder = to_employee_no
			coin.transfer_id = transfer_id
			coin.save
		end
		
	end

	def self.update_transfer(transfer_id, from_employee_no, to_employee_no,  transfer_date, coin_num)
		self.reset_get_coins(transfer_id)
		self.add_transfer(transfer_id, from_employee_no, to_employee_no, transfer_date, coin_num)
	end


	def self.reset_get_coins(transfer_id)
		coins = self.where({transfer_id: transfer_id})
		coins.each do |c|
			c.holder = nil
			c.transfer_date = nil
			c.transfer_id = nil
			c.save!
		end
	end




	def self.add_exchange(exchange_id, holder_no, exchange_date, coin_num)
		raise "you cannot exchange coins more than you have" if self.where({holder: holder_no, exchange_id: nil}).count < coin_num
		coin_num.times do
			coin = self.where({holder: holder_no, exchange_id: nil}).take!
			coin.exchange_date = exchange_date
			coin.exchange_id = exchange_id
			coin.save!
		end
	end



	def self.reset_exchange_get_coins(exchange_id)
		coins = self.where({exchange_id: exchange_id})
		coins.each do |c|
			c.exchange_date = nil
			c.exchange_id = nil
			c.save!
		end
	end


	def self.update_exchange(exchange_id, holder_no, exchange_date, coin_num)
		self.reset_exchange_get_coins(exchange_id)
		self.add_exchange(exchange_id, holder_no, exchange_date, coin_num)
	end

end
