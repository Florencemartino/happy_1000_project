class BasketsController < ApplicationController

  def index
    @whishlists = Whishlist.all

  end

  def show
    @basket = Basket.find(params[:id])
    @whishlist = @basket.whishlist
  end

  def select_items
    @whishlists = Whishlist.all
  end
end
