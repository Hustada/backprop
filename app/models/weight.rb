class Weight < ApplicationRecord
	belongs_to :exercise
	validates :amount, presence: true, length: { maximum: 255 }
	validates :reps, presence: true, length: { maximum: 255 }
end
