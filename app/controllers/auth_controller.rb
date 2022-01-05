class AuthController < ApplicationController
  protect_from_forgery
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_email(params[:user][:email])
    if @user.password == params[:password]
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
end