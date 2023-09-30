class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @event = Event.find(params[:id])
    @creator = User.find(@event.creator_id)
  end

  private

  def event_params
    event_params = params.require(:event).permit(:name, :date, :location)
  end
end
