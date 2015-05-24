class StaffsController < ApplicationController
	layout "yeti"
	before_action :authenticate_user!
	def index
		@staffs = Staff.all
	end
end
