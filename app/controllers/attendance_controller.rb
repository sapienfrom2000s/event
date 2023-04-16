require 'pry-byebug'

class AttendanceController < ApplicationController
  def create
    if attendance_params["join"] == 'yes'
      attendance = Attendance.new
      attendance.attendee = current_user
      attendance.attended = Action.find(params[:e_id])
    end

    if attendance.save
      flash[:notice] = 'You successfully enrolled for the event'
      redirect_to e_index_path
    else
      flash[:notice] = 'Something went wrong'
    end 
  end

  private

  def attendance_params
    params.require(:attendance).permit(:join)
  end
end
