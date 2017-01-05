class CreateWorkouts < ActiveRecord::Migration[5.0]
  def change
    create_table :workouts do |t|
      t.string :bodypart
      t.datetime :date
      t.string :length

      t.timestamps
    end
  end
end
