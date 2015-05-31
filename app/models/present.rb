class Present < ActiveRecord::Base
	validates_presence_of :from_employee_no, :to_employee_no, :description, :coin_num
	before_create :set_transfer_date_to_now

	private

	def set_transfer_date_to_now
		self.transfer_date = Time.now
	end
end
