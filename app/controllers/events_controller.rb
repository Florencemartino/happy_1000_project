class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
    # 2 cas : afficher les cartes des events auxquels on est invite, ET les evenements qu'on organise
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    if @event.save
      redirect_to event_whishlists_path(@event.id)
    else
      render :new
    end
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
    @whishlists = Whishlist.where(event_id: @event.id)
    @baskets = Basket.where(user_id: current_user.id)
  end

  def select_guest
    @event = Event.find(params[:event_id])

  # BARRE SEARCH  BARRE SEARCH  BARRE SEARCH  BARRE SEARCH  BARRE SEARCH
    if params[:query].present?
      @guests = User.where("nickname ILIKE ?", "%#{params[:query]}%")
    else
      @guests = User.where.not(id: current_user.id)
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to :root
  end

  def account
    @event = Event.find(params[:event_id])
    @guests = Guest.where(event_id: @event.id)
    @whishlists = Whishlist.where(event_id: @event.id)
    @baskets = Basket.where(user_id: current_user.id)
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :address, :date)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
