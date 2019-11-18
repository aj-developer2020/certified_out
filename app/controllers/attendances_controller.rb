class AttendancesController < ApplicationController

  # before_action :authenticate_user!
  # before_action :authorize_user!, only: [ :create ]

  def new
    # redirect_to root_path unless can?(:new, current_user)
    @cohort = Cohort.find(params[:cohort_id])
    # @block = Block.find(params[:block_id])
    @registrations = Registration.where(cohort_id: @cohort.id).order(user_id: :desc)
    # @attendances = Attendance.all
    @users = []
    for i in @registrations
      @users.push(User.find_by(id: i.user_id))
    end
    @blocks = Block.where(cohort_id: @cohort.id)
    # @users = User.where(user_id: @registrations.user_id)
  end

  def create
    @block = Block.find(params[:id])
    @cohort = Cohort.find(params[:cohort_id])

    attendances = params.require(:attendance)
    attendances.each do |user_id, add_user|
      user_id = user_id.to_i
      add_user = add_user.to_i
      puts user_id
      puts add_user
      if(add_user==1)
        attendance = Attendance.new(user_id: user_id, block_id: @block.id)
        if attendance.save
          puts "SAVED"
        end
      elsif(Attendance.exists?(user_id: user_id, block_id: @block.id))
        Attendance.where(user_id:user_id, block_id:@block.id).destroy_all
      end
    end
    redirect_to cohort_block_path(@cohort, @block)
  end


end
