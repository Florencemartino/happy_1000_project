class GuestsController < ApplicationController

  before_action :set_event

  def index
  end

  def create
    # binding.pry
    # url = params[:url]
    params[:guests_ids].each do |guest_id|
      @guest = Guest.new
      @guest.user = User.find(guest_id)
      @guest.event = Event.find(params[:event_id])
      if @guest.save!
        UserMailer.welcome.deliver_now
      redirect_to event_dashboard_path(@event)
      else
        render :new
      # GuestInvitationMailer.send_url(@guest, url).deliver_now
      end
    end
  end

  private

  def guest_params
  end

  def set_event
    @event = Event.find(params[:event_id])
  end

end
