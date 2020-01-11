class UsersController < ApplicationController 
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
    else
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find_by_id(session[:user_id])
  end
 
  private
 
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end 