class PresentsController < ApplicationController
	before_action :authenticate_user!, except: [:index]
	before_action :set_present, only: [:update, :destroy]
	def index
		@employees = Employee.select("id, no, name")
		@presents = Present.select("id, transfer_date, from_employee_no, from_employee_name, to_employee_no, to_employee_name, description, coin_num")
		respond_to do |format|
			format.html 
			format.json {render json: @presents }
		end
	end

	def create
		@present = Present.new(present_params)


		# present 保存后，要相应更新 coin 和 employee
		if 	@present.transaction do
				@present.save!
				Coin.add_transfer(@present.id, @present.from_employee_no, @present.to_employee_no,  @present.transfer_date, @present.coin_num)
				Employee.find_by_no(@present.to_employee_no).add_get_coins(@present.coin_num)
				Employee.find_by_no(@present.from_employee_no).reduce_own_coins(@present.coin_num)
			end

			respond_to do |format|
				format.json { render json: @present, status: :ok }
			end

		else
			respond_to do |format|
				format.json { render json: @present.errors, status: :unprocessable_entity }
			end
		end
	end


	def update
		oldCoinNum = @present.coin_num
		if @present.transaction do
				@present.update!(present_params)
				Coin.update_transfer(@present.id, @present.from_employee_no, @present.to_employee_no, @present.transfer_date, @present.coin_num)
				Employee.find_by_no(@present.to_employee_no).update_get_coins(oldCoinNum, @present.coin_num)
				Employee.find_by_no(@present.from_employee_no).update_own_coins(oldCoinNum, @present.coin_num)
			end

			respond_to do |format|
				format.json { render json: @present, status: :ok }
			end

		else
			respond_to do |format|
				format.json { render json: @present.errors, status: :unprocessable_entity }
			end
		end
	end


	def destroy
		# 要删除干净
		if @present.transaction do
				Employee.find_by_no(@present.to_employee_no).delete_get_coins(@present.coin_num)
				Employee.find_by_no(@present.from_employee_no).add_own_coins(@present.coin_num)
				Coin.reset_get_coins(@present.id)
				@present.destroy!
			end
			respond_to do |format|
				format.json { render json: @present, status: :ok }
			end
		else
			respond_to do |format|
				format.json { render json: @present.errors, status: :unprocessable_entity }
			end
		end
	end

	private


	def set_present
		@present = Present.find(params[:id])
	end

	def present_params
		params.permit(:id, :transfer_date, :from_employee_no, :from_employee_name, :to_employee_no, :to_employee_name, :description, :coin_num)
	end
end
