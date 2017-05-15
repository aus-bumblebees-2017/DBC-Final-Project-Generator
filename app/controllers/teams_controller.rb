class TeamsController < ApplicationController
  def new
    # flash id instead of 1
    @cohort = Cohort.find(1)
    @pitches = @cohort.current_pitches
    flash[:cohort_id] = @cohort.id

  end

  def create
   @cohort = Cohort.find(flash[:cohort_id]) 
  flash[:cohort_id] = @cohort.id
    params[:teams_].each do |student, pitch|
      s = Student.find(student)
      s.pitch_id = pitch
      s.save
    end 
    @cohort.teams = true
    @cohort.save
    redirect_to teams_path(@teams, cohort_id: @cohort.id)
  end

  def index
    @cohort = Cohort.find(params[:cohort_id])
    @teams = []

    @cohort.current_pitches.each do |pitch|
      team = @cohort.students.where(pitch_id: pitch.id)
      @teams << team
    end
  end

  def show
   @pitch = Pitch.find(current_student.pitch_id) 
    @team = current_student.cohort.students.where(pitch_id: current_student.pitch_id)
  end
end
