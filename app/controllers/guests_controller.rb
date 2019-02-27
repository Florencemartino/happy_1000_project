class GuestsController < ApplicationController

  def index
    @event = Event.find(params[:event_id])
    @guests = Guest.where(is_coming: true)
  end

end
