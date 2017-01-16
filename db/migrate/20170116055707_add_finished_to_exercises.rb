class AddFinishedToExercises < ActiveRecord::Migration[5.0]
  def change
  	add_column :exercises, :finished, :boolean, default: :false
  end
end