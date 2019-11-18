class GradesController < ApplicationController
  
  def create
    @assignment = Assignment.find(params[:id])
    @cohort = Cohort.find(params[:cohort_id])

    grades = params.require(:grade)
    grades.each do |user_id, value|
      user_id = user_id.to_i
      value = value.to_i
      
      if(value != 0)
        grade = Grade.new(user_id: user_id, assignment_id: @assignment.id)
        
        if grade.save
          puts "SAVED"
        end
      elsif(Grade.exists?(user_id: user_id, assignment_id: @assignment.id))
        Grade.where(user_id:user_id, assignment_id:@assignment.id).destroy_all
      end
    end
    redirect_to cohort_assignment_path(@cohort, @assignment)
  end

end
