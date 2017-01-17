class Weight < ApplicationRecord
	belongs_to :exercise
	belongs_to :workout
	validates :amount, presence: true, length: { maximum: 255 }
	validates :reps, presence: true, length: { maximum: 255 }
end
