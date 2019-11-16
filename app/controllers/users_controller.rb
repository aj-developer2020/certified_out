class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  def index
    @users = User.all
    # we will probably have a way to sort the index based on if they search by certain params such as, user role, either here, or in the view. 
  end

  def show
    @user=current_user
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user=current_user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: 'User was successfully created.' 
      # session[:user_id] = @user.id
      # redirect_to root_path
    else
      render :new
    end
  end

  def update
    user=current_user
    if(user.role===2 && user.update(user_params)
        redirect_to user_path(user), notice: 'Profile changes saved successfully as admin user.'

    elsif(user?(@user) && user.update(params.require(:user).permit(:email, :first_name, :last_name, :picture_url, :phone))
      redirect_to user_path(user), notice: 'Profile changes saved successfully.'
      
    else 
      render :edit
    end
  end

  # def destroy
  #   redirect_to(root_url) unless current_user?(@user)||current_user.admin?
  #   @user.destroy
  #   redirect_to root_path, notice: 'User was successfully destroyed.' }
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def find_user
      @user = User.find(params[:id])
    end

    def correct_user
      redirect_to(root_url) unless (current_user?(@user)||current_user.role===2)
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:role, :email, :first_name, :last_name, :password_digest, :picture_url, :phone, :is_active)
    end
end
