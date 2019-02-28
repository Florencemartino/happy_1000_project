class BasketsController < ApplicationController
  before_action :authenticate_user!

  def new
    @event = Event.find(params[:event_id])
    @basket = Basket.new
  end

  def index
    @event = Event.find(params[:event_id])
    @whishlists = Whishlist.all
  end

  def edit
    raise
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
