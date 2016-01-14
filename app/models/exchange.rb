class Exchange < ActiveRecord::Base
	validates_presence_of :holder_no, :holder_no, :coin_num, :gifts
	before_create :set_exchange_date_to_now

	private

	def set_exchange_date_to_now
		self.exchange_date = Time.now
	end
end
