class SessionsController < ApplicationController 
  
  def new
    @user = User.new
  end
  
  def create
    if params[:user][:name] == nil || params[:user][:name].empty?
      redirect_to login_path
    else
      @user = User.find_by(name: params[:user][:name])
        if @user.authenticate(params[:user][:password])
          session[:user_id] = @user.id
          redirect_to user_path(@user)
        else
          redirect_to login_path
        end
      end
    end
  
  def destroy
    session.delete :name
  end
end 