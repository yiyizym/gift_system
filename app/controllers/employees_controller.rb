class EmployeesController < ApplicationController
	before_action :set_employee , only: [:update, :destroy]
	def index
		@employees = Employee.select("id, no, name, own_coins, get_coins")
			respond_to do |format|
			format.html 
			format.json {render json: @employees }
		end
	end

	def create
		@employee = Employee.new(employee_params)
		if @employee.save
			respond_to do |format|
				format.json { render json: @employee, status: :ok }
			end
		else
			respond_to do |format|
				format.json { render json: @employee.errors, status: :unprocessable_entity }
			end
		end
	end

	def update
		respond_to do |format|
			if @employee.update(employee_params)
				format.json { render json: @employee, status: :ok }
			else
				format.json { render json: @employee.errors, status: :unprocessable_entity }
			end
		end
	end


	def destroy
		respond_to do |format|
			if @employee.destroy
				format.json { render json: @employee, status: :ok }
			else
				format.json { render json: @employee.errors, status: :unprocessable_entity }
			end
		end
	end

	private
	
	def set_employee
		@employee = Employee.find(params[:id])
	end



	def employee_params
		params.permit(:id, :no, :name, :own_coins, :get_coins)
	end
end
