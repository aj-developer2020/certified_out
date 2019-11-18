class RegistrationsController < ApplicationController

  # before_action :authenticate_user!
  before_action :find_cohort, only: [ :create, :new ]
  # before_action :authorize_user!, only: [ :create ]
 
  def new
    @users = User.where(role: 0).all
    @registration = Registration.new
    @registrations = Registration.where(cohort_id: @cohort.id)
    puts "------------------------"
    p @registrations
    puts "------------------------"
  end
 
  def create
    registrations = params.require(:registration)
    registrations.each do |user_id, add_user|
      user_id = user_id.to_i
      add_user = add_user.to_i
      puts user_id
      puts add_user
      if(add_user==1)
        register = Registration.new(user_id: user_id, cohort_id: @cohort.id)
        if register.save
          puts "SAVED"
        end
      elsif(Registration.exists?(user_id: user_id, cohort_id: @cohort.id))
        Registration.where(user_id:user_id, cohort_id:@cohort.id).destroy_all
      end
    end
    redirect_to @cohort
  end


  private
  def find_cohort
    @cohort = Cohort.find(params[:cohort_id])
  end
end
