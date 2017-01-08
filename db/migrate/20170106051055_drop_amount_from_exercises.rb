class DropAmountFromExercises < ActiveRecord::Migration[5.0]
  def change
  	remove_column :exercises, :amount
  end
end
