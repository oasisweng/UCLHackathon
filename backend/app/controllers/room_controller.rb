class RoomController < ApplicationController
	skip_before_filter  :verify_authenticity_token

	def index
		@rooms = Room.all
		respond_to do |format|
			format.json {render json: @rooms}
		end
	end

	def show
		@room = Room.find_by_id(params[:id])
		respond_to do |format|
			format.json {render json: @room}
		end
	end

	def create
		@room = Room.new(room_param)
		respond_to do |format|
			if @room.save
				format.json {render json: @room, status: :created }
			else
				format.json {render json: @room, status: :unprocessable_entity }
			end
		end
	end

	def update
		@room = Room.find_by_id(params[:id])
		respond_to do |format|
			if @room.update_attributes(room_param)
				format.json {head :no_content, status: :updated}
			else
				format.json {render json: @room.errors, status: :unprocessable_entity}
			end
		end
	end

	private

	def room_param
		params.permit(:postal, :address, :tenants, :smoking, :pet, :minimal, :billsIncluded, :Price, :deposit, :rente)
	end
end
