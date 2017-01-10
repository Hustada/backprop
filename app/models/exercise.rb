class Exercise < ApplicationRecord
	belongs_to :workout
	has_many :weights
	accepts_nested_attributes_for :weights
	validates :name, presence: true
	validates_associated :weights
end
