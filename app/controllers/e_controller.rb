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
  end

  def create

    @event = current_user.events.build(event_params)

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
    params.require(:event).permit(:time, :location, :title)
  end

end
