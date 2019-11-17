class RegistrationsController < ApplicationController

  # before_action :authenticate_user!
  before_action :find_cohort, only: [ :create, :new ]
  # before_action :authorize_user!, only: [ :create ]

  def new
    @users = User.where(role: 0).all
  end

  def create
    # registration = Registration.new(cohort: @cohort, user: current_user)
    # if registration.save
    #   flash[:success] = "Cohort Registered"
    # else
    #   flash[:danger] = registration.errors.full_messages.join(", ")
    # end
    # redirect_to cohort_path(@cohort)
    @users = User.where(params.student_name == 1).all

    puts "!!!!!"
    puts @users
  end

  # def destroy
  #   like = current_user.likes.find params[:id]
  #   if can? :destroy, like
  #     like.destroy
  #     flash[:success] = "Question unliked"
  #   else
  #     flash[:alert] = "Can't delete like"
  #   end
  #   redirect_to question_path(like.question)
  # end


  private
  def find_cohort
    @cohort = Cohort.find(params[:cohort_id])
  end

  # def authorize_user!
  #   unless can? :like, @question
  #     flash[:danger] = "Don't be a narcissist"
  #     redirect_to question_path(@question)
  #   end
  # end

end
