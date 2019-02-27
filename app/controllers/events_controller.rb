class EventsController < ApplicationController

  before_action :set_event, only: [:edit, :destroy, :account]

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
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
    @event = Event.find(params[:event_id])
  end

  def select_guest
    @guests = User.all
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
