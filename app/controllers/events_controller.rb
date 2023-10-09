class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      flash[:notice] = "Event created successfully"
      redirect_to root_path
    else
      flash[:notice] = "An error occurred, please try again"
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @event = Event.find(params[:id])
    @creator = User.find(@event.creator_id)
  end

  def edit
    # GET /events/:id/edit as events#edit, returns an HTML form for editing
    # edit_event_path
    # @event = Event.find(params[:id])
    @event = current_user.created_events.find(params[:id])
    if @event.date < Date.today
      redirect_to root_path
    end
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end

  def update
    # PUT/PATCH /events/:id as events#update, updates an existing event
    # @event = Event.find(params[:id])
    @event = current_user.created_events.find(params[:id])

    if @event.update(event_params)
      flash[:notice] = "Event updated successfully"
      redirect_to event_path(:id => params[:id])
    else
      flash[:notice] = "An error occurred, please try again"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:notice] = "This event has been deleted."
    redirect_to root_path
  end

  private

  def event_params
    event_params = params.require(:event).permit(:name, :date, :location)
  end
end
