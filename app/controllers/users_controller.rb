class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new, alert: "Something went wrong, please try again"
    end
  end

  def show
    redirect_to root_path unless current_user
  end

  def edit
    redirect_to current_user, alert: "Must be an Admin to edit user" unless current_user.admin
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
  end

end
