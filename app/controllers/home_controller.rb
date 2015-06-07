class HomeController < ApplicationController
	layout "yeti"
	def download
		@employees = Employee.all
		@publishes = Publish.all
		@exchanges = Exchange.all
		@presents = Present.all
		respond_to do |format|
			format.xlsx {render xlsx: 'download', filename: "#{Time.now}-蓝箭币记录.xlsx" }
		end
	end
end
