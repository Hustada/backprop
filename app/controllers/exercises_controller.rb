class ExercisesController < ApplicationController
  before_action :authenticate_user!

  def new
    @exercise = Exercise.new
  end

  def index
    @workout = Workout.find(params[:workout_id])
    @exercise = @workout.exercises
  end

  def create
    @workout = Workout.find(params[:workout_id])
    @exercise = @workout.exercises.build(exercise_params)
    @exercise.save!
    redirect_to workout_exercise_path(@workout, @exercise)
  end

  def edit
  end

  def show
    @workout = Workout.find(params[:workout_id])
    @exercise = @workout.exercises.find(params[:id])
  end

  def destroy
  end


  private

  def exercise_params
    params.require(:exercise).permit(:name, :workout_id)
  end
end
