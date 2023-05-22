require 'pry-byebug'

class EController < ApplicationController

  before_action :authenticate_user!

  def index
    @events = Action.all
  end

  def my_events
    @events = current_user.events
  end

  def new
    @event = Action.new
  end

  def show
    @event = Action.find(params[:id])
    @attendance = Attendance.new
  end

  def create

    @event = current_user.events.build(Action.combine_date_and_time(event_params))

    if @event.save
      flash[:notice] = 'Event created successfully'
      redirect_to e_index_path
    else
      flash[:notice] = 'Something went wrong'
      render :new
    end
  end

  private 

  def event_params
    params.require(:event).permit(:start_time, :start_date, :end_date, :end_time, :description, :location, :title)
  end

end
