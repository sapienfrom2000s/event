class Action < ApplicationRecord
	belongs_to :creator, class_name: 'User'
	has_many :attendances, foreign_key: :attended_id
	has_many :attendees, through: :attendances

	def self.combine_date_and_time(params)
		start_time = params[:start_date]+" "+params[:start_time]
		end_time = params[:end_date]+" "+params[:end_time]
		params.delete(:start_date)
		params.delete(:end_date)
		params
	end
end	