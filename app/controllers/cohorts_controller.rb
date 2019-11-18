class CohortsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_cohort, only: [:show, :edit, :update, :destroy]
  before_action :authorize!, only: [:destroy]

  def index 
    @cohorts = Cohort.all
  end

  # GET /cohorts/1
  # GET /cohorts/1.json
  def show
     # For the 'form_with' helper
     @block = Block.new
     # For the list of answers
     @blocks = @cohort.blocks.order(created_at: :desc)
     @registration = @cohort.registrations.find_by(user: current_user)
     @registrations = Registration.where(cohort_id: @cohort.id)
     @users = []
    for i in @registrations
      @users.push(User.find_by(id: i.user_id))
    end

  end

  def new
    redirect_to cohorts_path, alert: 'Not Authorized' unless can?(:new, @cohort)
    @cohort = Cohort.new
  end

  def edit
    redirect_to cohorts_path, alert: 'Not Authorized' unless can?(:update, @cohort)
  end

  def create
    redirect_to cohorts_path, alert: 'Not Authorized' unless can?(:create, @cohort)
    @cohort = Cohort.new(cohort_params)
    @cohort.user_id = current_user

    if @cohort.save
      flash[:notice] = "Cohort created successfully"
      redirect_to cohorts_path(@cohort)
    else
      render :new
    end
  end

  def update
    redirect_to cohorts_paths, alert: 'Not Authorized' unless can?(:update, @cohort)
    if @cohort.update(cohort_params)
      redirect_to cohort_path(@cohort)
    else
      render :edit
    end
  end

  def destroy
    redirect_to cohorts_path, alert: 'Not Authorized' unless can?(:destroy, @cohort)
    flash[:notice] = "Cohort destoryed!"
    @cohort.destroy
    redirect_to cohorts_path
  end

  def registered
    @cohorts = current_user.registered_cohorts.order('registrations.created_at DESC')
  end

  def filter
    @status=params[:status].to_i
    @program = params[:program].to_i
    @cohorts = Cohort.all
    render :index
  end

  private
    def find_cohort
      @cohort = Cohort.find(params[:id])
    end

    def cohort_params
      params.require(:cohort).permit(:title, :slack, :description, :picture_url, :status, :program, :is_archived, :start_date)
    end
    def authorize!
      redirect_to cohorts_path, alert: 'Not Authorized' unless can?(:crud, @cohort)
    end
end
