class UsersController < ApplicationController

  def new
  	@user = User.new
  end

  def index
  	@users = User.all
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		flash[:success] = "You have successfuly posted your thought."
  		redirect_to @user
  	else
  		render 'new'
  	end
  end

  def show
  	@user = User.find(params[:id])
  end


  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update_attributes(user_params)
  		redirect_to @user
  	else
  		render 'new'
  	end
  end

  def destroy
  	@user = User.find(params[:id]).destroy
  	flash[:danger] = "You have deleted User."
  	redirect_to users_url
  end

  private
  	def user_params
  		params.require(:user).permit(:title, :description, :category_id)
  	end
end
