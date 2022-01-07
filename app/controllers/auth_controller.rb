class AuthController < ApplicationController
  #protect_from_forgery
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_email(user_params[:email])
    if @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
      redirect_to feed_path
    else
      redirect_to :new, alert: @user.errors.full_messages.join
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to feed_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end