class GuestsController < ApplicationController

  before_action :set_event

  def index
  end

  def create
    # binding.pry
    params[:guests_ids].each do |guest_id|
      @guest = Guest.new
      @guest.user = User.find(guest_id)
      @guest.event = Event.find(params[:event_id])
      @guest.save!
    end
    # redirect_to event_dashboard_path(@event)
    redirect_to event_whishlists_path(@event)
  end

  private

  def guest_params
  end

  def set_event
    @event = Event.find(params[:event_id])
  end

end
