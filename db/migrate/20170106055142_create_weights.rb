class CreateWeights < ActiveRecord::Migration[5.0]
  def change
    create_table :weights do |t|
      t.integer :amount
      t.integer :reps
      t.references :exercise

      t.timestamps
    end
  end
end
