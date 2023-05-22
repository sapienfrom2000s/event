require 'pry-byebug'

class AttendanceController < ApplicationController
  def create
    return unless attendance_params["join"] == 'yes'
    @attendance = Attendance.attend_event(params, current_user)
    
    if @attendance.save
      flash[:notice] = 'You successfully enrolled for the event'
      redirect_to e_index_path
    else
      flash[:notice] = 'Something went wrong'
    end
  end

  def delete
    return unless attendance_params["unjoin"] == 'yes'
    current_user.attended.delete(Action.find(params[:e_id]))    
    flash[:notice] = 'Successfully unsubsribed to the event'
    redirect_to e_index_path
  end

  private

  def attendance_params
    params.require(:attendance).permit(:join, :unjoin)
  end
end
