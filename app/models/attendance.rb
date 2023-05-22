class Attendance < ApplicationRecord
	belongs_to :attendee, class_name: 'User'
	belongs_to :attended, class_name: 'Action'

	def self.attend_event(params, current_user)
		@attendance = self.new
		@attendance.attendee = current_user
		@attendance.attended = Action.find(params[:e_id])
		@attendance
	end
end
