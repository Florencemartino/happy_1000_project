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
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    redirect_to root_path
  end

  def dashboard
    @event = Event.find(params[:event_id])
  end

  def select_guest
    @guests = User.all

    # if params[:query].present?
    #   @guest = User.where("nickname ILIKE ?", "%#{params[:query]}%")
    # else
    #   @guests = User.all
    # end
  end

  def destroy
    @event = Event.find(params[:event_id])
    @event.destroy
    redirect_to :root
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
