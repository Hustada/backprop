class AddWorkoutIdToWeights < ActiveRecord::Migration[5.0]
  def change
  	add_column :weights, :workout_id, :integer
  end
end
