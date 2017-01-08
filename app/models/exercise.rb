class Exercise < ApplicationRecord
	belongs_to :workout
	has_many :weights
	accepts_nested_attributes_for :weights
end
