class EventController < ApplicationController
  def dashboard
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to :
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def account
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :address, :date)
  end
end
