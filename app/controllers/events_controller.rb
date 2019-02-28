class EventsController < ApplicationController
    before_action :authenticate_user!
 before_action :set_event, only: [:show, :edit, :update, :destroy, :account]

  def index
    @events = Event.all
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
      redirect_to root_path
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
    @user_baskets = @baskets.select {|x| x.user_id == current_user.id}
  end

  def select_guest

    @guests = User.where.not(id: current_user.id)

# ALERT INVITATION BIEN ENVOYE - ALERT INVITATION BIEN ENVOYE
  # if on appui sur btn submit
  #   flash.now[:notic] = "Ton invitation a bien été envoyée 🎉"
  #   render :select_guest
  # end

# BARRE SEARCH  BARRE SEARCH  BARRE SEARCH  BARRE SEARCH  BARRE SEARCH
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
