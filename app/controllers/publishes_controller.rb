class PublishesController < ApplicationController
	before_action :set_publish, only: [:update, :destroy]
	def index
		@employees = Employee.select("id, no, name")
		@publishes = Publish.select("id, publish_date, employee_no, employee_name, coin_num")
			respond_to do |format|
			format.html 
			format.json {render json: @publishes }
		end
	end
	def create
		@publish = Publish.new(publish_params)


		# publish 保存后，要相应更新 coin 和 employee
		if 	@publish.transaction do
				@publish.save!
				Coin.create_coins(@publish.employee_no, @publish.id, @publish.coin_num)
				Employee.find_by_no(@publish.employee_no).add_coins(@publish.coin_num)
			end

			respond_to do |format|
				format.json { render json: @publish, status: :ok }
			end

		else
			respond_to do |format|
				format.json { render json: @publish.errors, status: :unprocessable_entity }
			end
		end
	end
	
	def update
		oldCoinNum = @publish.coin_num
		if @publish.transaction do
			@publish.update!(publish_params)
			Coin.update_coins(@publish.employee_no, @publish.id, @publish.coin_num)
			Employee.find_by_no(@publish.employee_no).update_coins(oldCoinNum, @publish.coin_num)
			end

			respond_to do |format|
				format.json { render json: @publish, status: :ok }
			end

		else
			respond_to do |format|
				format.json { render json: @publish.errors, status: :unprocessable_entity }
			end
		end

	end


	def destroy
		# 要删除干净
		if @publish.transaction do
				Employee.find_by_no(@publish.employee_no).delete_coins(@publish.coin_num)
				Coin.destroy_coins(@publish.id)
				@publish.destroy!
			end
			respond_to do |format|
				format.json { render json: @publish, status: :ok }
			end
		else
			respond_to do |format|
				format.json { render json: @publish.errors, status: :unprocessable_entity }
			end
		end
	end

	private

	def set_publish
		@publish = Publish.find(params[:id])
	end

	def publish_params
		params.permit(:id, :publish_date, :employee_no, :employee_name, :coin_num)
	end
end
