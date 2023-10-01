class SignupsController < ApplicationController
  def new
    @signup = Signup.new
  end

  def create
    @signup = Signup.new
    @signup.attendee_id = current_user.id
    flash.notice = "Saved attendee_id as current_user.id #{current_user.id}"
    @signup.event_id = params[:event][:id]

    if @signup.save
      flash.notice = "You have successfully signed up for this event"
      redirect_to root_url
    else
      redirect_to event_path(params[:event][:id]), status: :unprocessable_entity
    end
  end
end
