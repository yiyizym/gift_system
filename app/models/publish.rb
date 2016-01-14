class Publish < ActiveRecord::Base
	validates_presence_of :employee_no, :employee_name

	validates :coin_num, numericality: { only_integer: true, greater_than: 0 }

	before_create :set_publish_date_to_now

	private

	def set_publish_date_to_now
		self.publish_date = Time.now
	end
end
