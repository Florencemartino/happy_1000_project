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
      raise
      redirect_to event_dashboard_path(@event)


    # if @guest.save
    #   flash.now[:notice] = "Ton invit' a bien été envoyée 🎉"
    #   redirect_to event_dashboard_path(@event)
    # else
    #   flash.now[:alert] = "Choisi au moins 1 poto à inviter quand même... 🙄"
    #   render :select_guest
    end
  end

  private

  def guest_params
  end

  def set_event
    @event = Event.find(params[:event_id])
  end

end
