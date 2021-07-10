class UsersController < ApplicationController

  before_action :set_user, only: [:edit, :update, :destroy]

  def index
    @users = User.ordered
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    redirect_to users_path
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to users_path
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
      redirect_to users_path, notice: 'Соискатель удален'
    else
      redirect_to users_path, alert: error_messages(@user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :surname, :phone_number, :address, :e_mail)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
