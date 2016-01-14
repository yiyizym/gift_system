class Employee < ActiveRecord::Base
	validates_presence_of :name, :no
	validates :no , uniqueness: true

	def delete_coins(num)
		raise "cannot delete more coins than the employee have." if  self.own_coins < num
		to_have = self.own_coins - num
		self.update!({own_coins: to_have})
	end

	def add_coins(num)
		sum_up = self.own_coins + num
		self.update!({own_coins: sum_up})
	end

	def update_coins(old_num, num)
		sum_up = self.own_coins + num - old_num
		raise "cannot update coins beacause num is less than 0." if sum_up < 0
		self.update!({own_coins: sum_up})
	end


	def add_get_coins(num)
		raise "num must greater than 0" if num < 1
		self.update!({get_coins: num})
	end


	def reduce_own_coins(num)
		raise "cannot give out coins more than you have" if self.own_coins < num
		self.update!({own_coins: self.own_coins - num})
	end


	def delete_get_coins(num)
		raise "cannot delete coins more than you have." if self.get_coins < num
		to_have = self.get_coins - num
		self.update!({get_coins: to_have})
	end

	def add_own_coins(num)
		raise "num must greater than 0" if num < 1
		to_have = self.own_coins + num
		self.update!({own_coins: to_have})
	end


	def update_get_coins(old_num, num)
		sum_up = self.get_coins + num - old_num
		raise "cannot update coins beacause num is less than 0." if sum_up < 0
		self.update!({get_coins: sum_up})
	end

	def update_own_coins(old_num, num)
		sum_up = self.own_coins - num + old_num
		raise "cannot update coins beacause num is less than 0." if sum_up < 0
		self.update!({own_coins: sum_up})
	end



	def exchange_get_coins(num)
		raise "cannot exchange coins more than you have." if self.get_coins < num
		to_have = self.get_coins - num
		self.update!({get_coins: to_have})
	end


	def delete_exchange_get_coins(num)

		raise "num must greater than 0" if num < 1
		to_have = self.get_coins + num
		self.update!({get_coins: to_have})
	end

	def update_exchange_get_coins(old_num, num)
		sum_up = self.get_coins - num + old_num
		raise "cannot update coins beacause num is less than 0." if sum_up < 0
		self.update!({get_coins: sum_up})
	end
end
