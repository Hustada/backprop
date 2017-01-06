class CreateExercises < ActiveRecord::Migration[5.0]
  def change
    create_table :exercises do |t|
      t.integer :amount
      t.integer :reps

      t.timestamps
    end
  end
end
