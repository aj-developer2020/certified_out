class UsersController < ApplicationController
  # before_action :authenticate_user! 
  before_action :find_user, only: [:show, :edit, :update, :destroy, :edit_password, :update_password]
  before_action :correct_user, only: [:edit, :update]

  before_action :authorize!, only: [:index]
  def index
    redirect_to root_path unless can?(:index, current_user)
    @users = User.all
    # we will probably have a way to sort the index based on if they search by certain params such as, user role, either here, or in the view. 
  end

  def show
    redirect_to root_path unless can?(:show, current_user)
  end

  # GET /users/new
  def new
    redirect_to root_path unless can?(:create, current_user)
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    redirect_to root_path unless can?(:update, current_user)
    # @user=current_user
  end

  # POST /users
  def create
    redirect_to root_path unless can?(:create, current_user)
    @user = User.new(user_params)
    if @user.save
      # session[:user_id] = @user.id
      redirect_to @user, notice: 'User was successfully created.' 
    else
      render :new
    end
  end

  def update
    updating_user=User.find_by(id: params.require(:id))
    redirect_to root_path unless can?(:update, updating_user)

    if(current_user.role===2 && updating_user.update(user_params))
      flash[:notice] ='Profile changes saved successfully as admin user.'
      redirect_to user_path(updating_user)
    elsif(current_user.update(params.require(:user).permit(:email, :first_name, :last_name, :picture_url, :phone)))
      flash[:notice] = 'Profile changes saved successfully.'
      redirect_to user_path(updating_user)
    else 
      render :edit
    end
  end
 
  def edit_password
    redirect_to root_path unless can?(:edit_password, current_user)
    # @user=current_user
  end

  def update_password
    redirect_to root_path unless can?(:update_password, current_user)
    @user=current_user
    if @user&.authenticate(params[:user][:current_password])
      if @user.update(user_params) 
        flash[:notice] = "Profile changes saved successfully"
        redirect_to user_path(@user)
      else
        flash[:notice] = "Passwords did not match"
        render :edit_password
      end
    else
      flash[:notice] = "Wrong current password"
      render :edit_password
    end
  end

  def destroy
    if (current_user.role!=2)
      flash[:notice] = 'Only admin is authorized to do this.'
      redirect_to(root_path)
    else
      @user.destroy
      flash[:notice] = 'User was successfully destroyed.' 
      redirect_to users_path
    end
  end

  def edit_password
    @user=current_user
  end

  def update_password
    @user=current_user
    if @user&.authenticate(params[:user][:current_password])
      if @user.update(user_params) 
        flash[:notice] = "Profile changes saved successfully"
        redirect_to user_path(@user)
      else
        flash[:notice] = "Passwords did not match"
        render :edit_password
      end
    else
      flash[:notice] = "Wrong current password"
      render :edit_password
    end
  end

  def filter
    @users= User.all
    @role=params[:role].to_i

    @active=params[:is_active].to_i

    if(@active==1)
      @active=true
    else
      @active=false
    end

    
    @user = User.all
    render :index
    # asofbapfap
  end
  class Integer
    def to_b?
      !self.zero?
    end
  end
  private
    
    # Use callbacks to share common setup or constraints between actions.
    def find_user
      @user = User.find(params[:id])
    end

    def correct_user
      redirect_to(root_path) unless (current_user== @user||current_user.role===2)
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:role, :email, :first_name, :last_name, :password, :picture_url, :phone, :is_active)
    end

    def authorize!
      # redirect_to root_path unless can?(:index, current_user)
    end
     
end
