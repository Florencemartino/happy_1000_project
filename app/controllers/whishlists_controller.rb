class WhishlistsController < ApplicationController
  def index
    @items = Item.all
    @whishlists = Whishlist.where(event: params[:id])
  end

  def new
  end

  def create
  end

  def update
    @whishlist = Whishlist.find(params[:id])
    case params[:sens]
    when "1"
      then @whishlist.quantity += 1
    when "-1"
      then @whishlist.quantity -= 1
    end
    @whishlist.save!
    redirect_to event_whishlists_path(@whishlist)
  end

  private

  def whislist_params
    params.require(:whishlist).permit(:quantity, :item_id, :event_id)
  end
end
