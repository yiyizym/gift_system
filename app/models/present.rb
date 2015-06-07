class Present < ActiveRecord::Base
	validates_presence_of :from_employee_no, :to_employee_no, :description, :coin_num
	before_create :set_default_transfer_date

	private

	def set_default_transfer_date
		self.transfer_date = self.transfer_date || Time.now
	end
end
