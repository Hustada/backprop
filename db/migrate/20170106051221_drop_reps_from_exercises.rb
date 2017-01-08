class DropRepsFromExercises < ActiveRecord::Migration[5.0]
  def change
  	remove_column :exercises, :reps
  end
end
