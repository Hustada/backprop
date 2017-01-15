class WorkoutsController < ApplicationController
  before_action :authenticate_user!

  def new
    @workout = Workout.new
  end

  def create
      @workout = current_user.workouts.new(workout_params)
      if @workout.save
        redirect_to @workout
      else
        flash[:notice] = "Something went wrong, workout not created"
      end
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
    @workouts = current_user.workouts
  end

  def show
    @workout = Workout.find(params[:id])
  end

  private

  def workout_params
    params.require(:workout).permit(:bodypart, :date, :length, :user_id, :exercise_attributes => [:name])
  end

end
