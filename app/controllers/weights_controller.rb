class WeightsController < ApplicationController
  before_action :authenticate_user!

  def new
    @weight = Weight.new
  end

  def create
    @exercise = Exercise.find(params[:exercise_id])
    @weight = @exercise.weights.build(weight_params)
    @weight.save!
    redirect_to exercise_path(@exercise)
  end

  def edit
  end

  def update
  end

  def destroy
    weight = Weight.find(params[:id])
    @weight.destroy
    redirect_to root_path
  end

  private

  def weight_params
    params.require(:weight).permit(:amount, :reps)
  end

end
