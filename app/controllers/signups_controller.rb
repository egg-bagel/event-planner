class SignupsController < ApplicationController

  before_action :authenticate_user!

  def new
    @signup = Signup.new
  end

  def create
    @signup = Signup.new
    @signup.attendee_id = current_user.id
    @signup.event_id = params[:event][:id]

    if @signup.save
      # I want to put a flash here, how?
      flash[:notice] = "You have successfully signed up for this event"
      # I want different redirects in different cases.
      # If the button was clicked on the home page, redirect to the root url.
      # If the button was clicked on the events page, redirect to the events page.
      # redirect_to root_url
      redirect_back_or_to root_path
    else
      flash[:notice] = "An error occurred, please try again"
      redirect_to event_path(params[:event][:id]), status: :unprocessable_entity
    end
  end

  def destroy
    @signup = Signup.find(params[:id])
    @signup.destroy
    flash[:notice] = "You are no longer attending this event"
    redirect_back_or_to root_path
  end
end