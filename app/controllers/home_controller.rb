class HomeController < ApplicationController
	layout "yeti"
	def index
		@employees = Employee.all
	end
end
