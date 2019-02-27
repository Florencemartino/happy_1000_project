class EventController < ApplicationController
  before_action :set_event, only: [:edit, :dashboard, :destroy, :account]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.save
  end

  def edit
  end

  def update
  end

  def dashboard
  end

  def destroy
  end

  def account
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :address, :date)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
