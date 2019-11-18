class AssignmentsController < ApplicationController

  before_action :find_cohort, only: [:show, :create, :edit, :index, :destroy, :show]
  before_action :find_assignment, only: [:show, :edit, :destroy]


  def index
    @cohort = Cohort.find(params[:cohort_id])
    @assignments = Assignment.all

  end

  def new
    @cohort = Cohort.find(params[:cohort_id])
    @assignment = Assignment.new
  end

  def edit

  end

  def create
    @cohort = Cohort.find(params[:cohort_id])
    @assignment = Assignment.new(assignment_params)
    @assignment.cohort = @cohort
    @assignment.user_id = current_user.id

    if @assignment.save
      redirect_to cohort_assignments_path(@cohort), notice: 'Assignment was successfully created.' 
    else
      @assignments = @cohort.assignments.order(created_at: :desc)
      render new_cohort_assignment_path(@cohort)
    end

  end

  def show
    @registrations = Registration.where(cohort_id: @cohort.id)

    @users = []
    for i in @registrations
      @users.push(User.find_by(id: i.user_id))
    end
    # sajdfiosajdfiojsidoafF
    @grades = Registration.where(cohort_id: @cohort.id)

    @grade = Grade.new
    
  end

  private

  def find_cohort
    @cohort = Cohort.find(params[:cohort_id])
  end

  def find_assignment
    @assignment = Assignment.find(params[:id])
  end

  def assignment_params
    params.require(:assignment).permit(:title, :description, :attachment)
  end
end