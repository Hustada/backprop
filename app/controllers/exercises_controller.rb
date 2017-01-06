class ExercisesController < ApplicationController
  def new
    @exercise = Exercise.new
  end

  def index
  end

  def create
    @workout = Workout.find(params[:workout_id])
    @exercise = @workout.exercises.build(exercise_params)
    @exercise.save!
    redirect_to workout_path(@workout)
  end

  def edit
  end

  def show
  end

  def destroy
  end


  private

  def exercise_params
    params.require(:workout).permit(:amount, :reps, :name)
  end
end
