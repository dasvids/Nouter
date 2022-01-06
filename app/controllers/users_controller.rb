class UsersController < ApplicationController
  #protect_from_forgery
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to feed_path
    else
      redirect_to :new, alert: @user.errors.full_messages.join
    end
  end

  private

  def user_params
    params.require(:user)
          .permit(:email, :password, :password_confirmation)
  end
end