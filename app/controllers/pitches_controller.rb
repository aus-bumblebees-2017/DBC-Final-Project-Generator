class PitchesController < ApplicationController
  def index
    @pitches = Pitch.all.sort_by(&:updated_at).reverse
  end

  def create
    @pitch = Pitch.create(pitch_params)
    if @pitch.save
      redirect_to "/students/index"
    else
      @errors = ["Error saving"]
      render 'new'
    end
  end

  def new
  end

  def edit
    @pitch = Pitch.find(params[:id])
  end

  def show
    @pitch = Pitch.find(params[:id])
  end

  def update
    @pitch = Pitch.find(params[:id])
     if @pitch.update_attributes(pitch_params)
      flash[:success] = "Pitch updated"
      redirect_to pitch_path(@pitch.id)
    else
      render 'edit'
    end
  end

  def destroy
    @pitch = Pitch.find(params[:id])
    @pitch.destroy
    #later this is home
    redirect_to "/students/index"
  end

private
  def pitch_params
    params.require(:pitch).permit(:name, :description, :student_id)
  end

end
