class Exchange < ActiveRecord::Base
	validates_presence_of :holder_no, :holder_no, :coin_num, :gifts
	before_create :set_default_exchange_date

	private

	def set_default_exchange_date
		self.exchange_date = self.exchange_date || Time.now
	end
end
