class StudentsController < ApplicationController
  def index
    if current_student 
    	if current_student.votes.count != current_student.cohort.vote_limit
  	    @cohort = current_student.cohort
  	    @student = Student.find(current_student.id)
  	    @current_pitches = current_student.cohort.current_pitches
  	    @student_pitches = current_student.pitches
      elsif current_student.cohort.teams == true
        redirect_to team_path(current_student.pitch_id)
      else
  			redirect_to votes_path
  		end
    else
      redirect_to new_student_session_path
    end
  end

  def show
    @student = Student.find(params[:id])
  end
end
