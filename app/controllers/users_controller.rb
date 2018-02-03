class UsersController < ApplicationController
  def index
    @user = User.new
  end

  def edit

  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		flash[:notice] = "User was successfully uploaded"
  		redirect_to user_path(@user)
  	else
  		render 'new'
  	end
  end

  def show
  	@user = User.find(params[:id])
  end

  private
    def user_params
    	params.require(:user).permit(:username, :email, :comment)
    	
    end
end