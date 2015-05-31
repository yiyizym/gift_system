class ExchangesController < ApplicationController
	layout "yeti"
	before_action :set_exchange, only: [:update, :destroy]

	def index
		@employees = Employee.select("id, no, name")
		@exchanges = Exchange.select("id, exchange_date, holder_no, holder_name, coin_num, gifts")
		respond_to do |format|
			format.html 
			format.json {render json: @exchanges }
		end
	end


	def create
		@exchange = Exchange.new(exchange_params)

		# exchange 保存后，要相应更新 coin 和 employee
		if 	@exchange.transaction do
				@exchange.save!
				Coin.add_exchange(@exchange.id, @exchange.holder_no, @exchange.exchange_date, @exchange.coin_num)
				Employee.find_by_no(@exchange.holder_no).exchange_get_coins(@exchange.coin_num)
			end

			respond_to do |format|
				format.json { render json: @exchange, status: :ok }
			end

		else
			respond_to do |format|
				format.json { render json: @exchange.errors, status: :unprocessable_entity }
			end
		end
	end


	def destroy
		# 要删除干净
		if @exchange.transaction do
				Employee.find_by_no(@exchange.holder_no).delete_exchange_get_coins(@exchange.coin_num)
				Coin.reset_exchange_get_coins(@exchange.id)
				@exchange.destroy!
			end
			respond_to do |format|
				format.json { render json: @exchange, status: :ok }
			end
		else
			respond_to do |format|
				format.json { render json: @exchange.errors, status: :unprocessable_entity }
			end
		end
	end


	def update
		oldCoinNum = @exchange.coin_num
		if @exchange.transaction do
				@exchange.update!(exchange_params)
				Coin.update_exchange(@exchange.id, @exchange.holder_no, @exchange.exchange_date, @exchange.coin_num)
				Employee.find_by_no(@exchange.holder_no).update_exchange_get_coins(oldCoinNum, @exchange.coin_num)
			end

			respond_to do |format|
				format.json { render json: @exchange, status: :ok }
			end

		else
			respond_to do |format|
				format.json { render json: @exchange.errors, status: :unprocessable_entity }
			end
		end
		
	end

	def set_exchange
		@exchange = Exchange.find(params[:id])
	end

	def exchange_params
		params.permit(:id, :exchange_date, :holder_no, :holder_name, :coin_num, :gifts)
	end
end
