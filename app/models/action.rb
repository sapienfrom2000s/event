class Action < ApplicationRecord
	belongs_to :creator, class_name: 'User'
	has_many :attendances, foreign_key: :attended_id
	has_many :attendees, through: :attendances
end
