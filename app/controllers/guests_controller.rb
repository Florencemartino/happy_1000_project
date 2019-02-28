class GuestsController < ApplicationController

  before_action :set_event

  def index
  end

  def create
    raise
    @guest = Guest.new(guest_params)
    @guest.user = current_user
    @guest.save
    redirect_to guests_invited_path(@event)
  end

  private

  def guest_params
    params.require(:guest).permit(:user_id, :event_id, :is_coming)
  end

  def set_event
    @event = Event.find(params[:event_id])
  end
end

