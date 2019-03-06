class GuestsController < ApplicationController

  before_action :set_event

  def index
  end

  def create
    params[:guests_ids].each do |guest_id|
      @guest = Guest.new
      @guest.user = User.find(guest_id)
      @guest.event = Event.find(params[:event_id])
      @guest.save!
      redirect_to event_dashboard_path(@event)
    end
  end

  private

  def guest_params
  end

  def set_event
    @event = Event.find(params[:event_id])
  end

end
