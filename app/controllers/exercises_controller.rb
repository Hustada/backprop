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
      if @exercise.save
        redirect_to workout_exercise_path(@workout, @exercise)
        flash[:notice] = "Exercise created, enter weight and reps for your first set"
      else 
        redirect_to @workout
        flash[:notice] = "#{@exercise.errors.full_messages.to_sentence}"
    end
  end

  def edit
  end

  def update
    @exercise = Exercise.find(params[:id])
    if @exercise.update_attributes(exercise_params)
      redirect_to exercise_path(@exercise)
    else
      flash[:notice] = "Some stupid shit just happened"
    end
  end

  def show
    @exercise = Exercise.find(params[:id])
    #just going to put this here(make sure to ORDER your collection otherwise phantom divs can appear)
    @weights = @exercise.weights.order('created_at DESC').paginate(page: params[:page], per_page: 5)
  end

  def destroy
  end

  def is_finished
    @exercise = Exercise.find(params[:id])
    @exercise.finished = true
    if @exercise.save
      redirect_to exercise_path(@exercise)
      flash[:notice] = "Exercise Finished!"
    else
      redirect_to exercise_exercise(@exercise)
      flash[:notice] = "Couldn't finish workout"
    end
  end

  def unfinish
    @exercise = Exercise.find(params[:id])
    @exercise.finished = false
    if @exercise.save
      redirect_to exercise_path(@exercise)
      flash[:notice] = "Workout unfinished"
    else
      redirect_to exercise_path(@wexercise)
      flash[:notice] = "Couldn't unfinish workout"
    end
  end


  private

 
  def exercise_params
    params.require(:exercise).permit(:name, :finished, :weights_attributes => [:amount, :reps])
  end
end
