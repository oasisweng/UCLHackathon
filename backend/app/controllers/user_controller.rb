class UserController < ApplicationController
	skip_before_filter  :verify_authenticity_token

	def show
		@user = User.find_by_id(params[:id])
		respond_to do |format|
			format.json {render json: @user}
		end
	end

	def create
		@user = User.new(person_params)
		respond_to do |format|
			if @user.save
				format.json {render json: @user, status: :created}
			else
				format.json {render json: @user, status: :unprocessable_entity}
			end
		end
	end

	def update
		@user = User.find_by_id(params[:id])
		respond_to do |format|
			if @user.update_attributes(person_params)
				format.json { head :no_content, status: :updated}
			else
				format.json {render json: @user.errors, status: :unprocessable_entity}
			end
		end
	end

	private
	def person_params
		params.permit(:username, :password, :email, :phonenumber, :age, :gender, :university, :course, :ethnics, :nationality, :interest, :hates, :smoking, :religion, :payple, :hasPaidDeposit, :Rid, :PairdUser)
	end
end
