class Workout < ApplicationRecord
	belongs_to :user
	has_many :exercises
	has_many :weights, through: :exercises
	accepts_nested_attributes_for :exercises, :allow_destroy => true
	accepts_nested_attributes_for :weights, :allow_destroy => true
	validates :bodypart, presence: true, length: { maximum: 255 }
end
