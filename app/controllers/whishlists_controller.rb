class WhishlistsController < ApplicationController
  def index
    @whishlists = Whishlist.all
    @whishlist = Whishlist.new
  end

  def new
  end

  def create
  end

  def update
    @whishlist = Whishlist.find(params[:id])
    @whishlist.quantity += 1
    @whishlist.save!
    redirect_to event_whishlists_path(@whishlist)
  end

  private

  def whislist_params
    params.require(:whishlist).permit(:quantity, :item_id, :event_id)
  end
end
