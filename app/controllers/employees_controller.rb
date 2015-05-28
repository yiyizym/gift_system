class EmployeesController < ApplicationController
	layout "yeti"
	def index
		@employees = Employee.all
		respond_to do |format|
			format.html
			format.json {render :json => @employees.to_json }
		end
	end

	def refresh
		@employees = Employee.all
		respond_to do |format|
			format.json {render :json => @employees.to_json }
		end
	end

	def create
		@employee = Employee.new
		@employee.no = params[:employeeNo]
		@employee.name = params[:employeeName]
		@employee.title = params[:employeeTitle]
		if @employee.save
			respond_to do |format|
				format.json { render :json => {status: "success", mgs: "OK"}.to_json }
			end
		else
			respond_to do |format|
				format.json { render :json => {status: "fail", mgs: "add employee fail"}.to_json }
			end
		end
	end
end
