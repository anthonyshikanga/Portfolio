class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(params[:user])
		if @user.save
			ModelMailer.new_user_notification(@user).deliver
			redirect_to @user, notice: "Signed up succesfully."
		else
			render :new
		end
	end
end
