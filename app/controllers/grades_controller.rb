class GradesController < ApplicationController
  
  def create
    @assignment = Assignment.find(params[:id])
    @cohort = Cohort.find(params[:cohort_id])

    grades = params.require(:grade)
    grades.each do |user_id, value|
      user_id = user_id.to_i
      value = value.to_i
      
      grade = Grade.new(user_id: user_id, assignment_id: @assignment.id, score: value)
      if(grade.save)
        
      elsif(Grade.exists?(user_id: user_id, assignment_id: @assignment.id))
        grade = Grade.update(user_id: user_id, assignment_id: @assignment.id, score: value)

        
      end
    end
    redirect_to cohort_assignment_path(@cohort, @assignment)
  end

  def index
    @cohort = Cohort.find(params[:cohort_id])
    @registrations = Registration.where(cohort_id: @cohort.id).order(user_id: :desc)
    @users = []
    for i in @registrations
      @users.push(User.find_by(id: i.user_id))
    end
    @assignments = Assignment.where(cohort_id: @cohort.id)
  end

end
