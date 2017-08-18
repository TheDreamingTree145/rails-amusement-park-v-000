class SessionsController < ApplicationController

  def signin
    @user = User.new
  end

  def create
    if @user = User.find_by(name: params[:user][:name])
      if @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to user_path(session[:user_id])
      else
        render :signin, alert: "Username or Password wrong"
      end
    else
      redirect_to new_user_path, alert: "No user found"
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end
end
