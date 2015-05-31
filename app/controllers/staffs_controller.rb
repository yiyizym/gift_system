class StaffsController < ApplicationController
	before_action :authenticate_user!
	def index
		@staffs = Staff.all
	end
end
