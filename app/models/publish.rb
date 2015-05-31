class Publish < ActiveRecord::Base
	validates_presence_of :employee_no, :employee_name

	before_create :set_publish_date_to_now

	private

	def set_publish_date_to_now
		self.publish_date = Time.now
	end
end
