class BasketsController < ApplicationController
  before_action :authenticate_user!

  def new
    @event = Event.find(params[:event_id])
    @basket = Basket.new
  end

  def index
    @event = Event.find(params[:event_id])
    @baskets = current_user.baskets.where(event: @event)
    @whishlists = Whishlist.all
  end

  def edit
    @event = Event.find(params[:event_id])
    @baskets = current_user.baskets.where(event: @event)
  end

  def update
    @basket = Basket.find(params[:id])
    @event = Event.find(params[:event_id])
    @basket.update(basket_params)
    if @basket.save
      redirect_to event_baskets_path
    else
      render :new
    end
  end

  def show
    @basket = Basket.find(params[:id])
    @whishlist = @basket.whishlist
  end

  def select_items
    @whishlists = Whishlist.all
  end

  private

  def basket_params
    params.require(:basket).permit(:price_in_cent)
  end
end
