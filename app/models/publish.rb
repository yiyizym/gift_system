class Publish < ActiveRecord::Base
	validates_presence_of :employee_no, :employee_name

	validates :coin_num, numericality: { only_integer: true, greater_than: 0 }

	before_create :set_default_publish_date

	private

	def set_default_publish_date
		self.publish_date = self.publish_date || Time.now
	end
end
