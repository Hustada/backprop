class ExercisesController < ApplicationController
  before_action :authenticate_user!
  # before_action :set_exercise, except: [:index, :new, :create]

  def new
    @exercise = Exercise.new
    @exercise.weights.new
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

  def update
    @exercise = Exercise.find(params[:id])
    if @exercise.update_attributes(exercise_params)
      redirect_to workout_exercise_path(@exercise)
    else
      flash[:notice] = "Some stupid shit just happened"
    end
  end

  def show
    @workout = Workout.find(params[:workout_id])
    @exercise = @workout.exercises.find(params[:id])
  end

  def destroy
  end


  private

  def set_exercise
    @exercise = Exercise.find(params[:id])
  end
  
  def exercise_params
    params.require(:exercise).permit(:name, :workout_id, :weights_attributes => [:amount, :reps])
  end
end
