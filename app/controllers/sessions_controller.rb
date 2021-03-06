class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new

    user = User.find_by_email params[:email]
    if !user.is_active
      flash[:alert] = "Account has been deactivated.  Please contact an administrator."
      render :new
    else
      if user&.authenticate(params[:password_digest])
        session[:user_id] = user.id
        redirect_to root_path, notice: "Logged In"
      else
        flash[:alert] = "Wrong email or password"
        render :new
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out!"
  end
  def authenticate_user!
    unless user_signed_in?
      flash[:danger] = "You must sign in or sign up first!"
      redirect_to new_session_path
    end
  end
end
