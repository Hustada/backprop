class WeightsController < ApplicationController
  before_action :authenticate_user!

  def new
    @weight = Weight.new
  end

  def create
    @exercise = Exercise.find(params[:exercise_id])
    @weight = @exercise.weights.new(weight_params)
    @weight.save!
    redirect_to exercise_weight_path(@weight)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def weight_params
    params.require(:weight).permit(:amount, :reps)
  end

end