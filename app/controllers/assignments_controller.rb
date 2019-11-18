class AssignmentsController < ApplicationController

  before_action :find_cohort, only: [:show, :edit, :index, :destroy]
  before_action :find_assignment, only: [:show, :edit, :index, :destroy]


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

  def find_cohort
    @cohort = Cohort.find(params[:cohort_id])
  end
  def find_assignment
    @assignment = Assignment.find(params[:id])
  end

end