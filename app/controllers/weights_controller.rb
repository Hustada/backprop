class WeightsController < ApplicationController
  before_action :authenticate_user!

  def new
    @weight = Weight.new
  end

  def create
      @exercise = Exercise.find(params[:exercise_id])
      @weight = @exercise.weights.build(weight_params)
    if @weight.save
      flash[:notice] = "Set saved"
      redirect_to exercise_path(@exercise)
    else
      redirect_to exercise_path(@exercise)
      flash[:notice] = "#{@weight.errors.full_messages.to_sentence}"
    end
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
