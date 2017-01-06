class AddWorkoutIdToExercises < ActiveRecord::Migration[5.0]
  def change
  	add_column :exercises, :workout_id, :integer
  end
end
