class WhishlistsController < ApplicationController
  def index
    @items = Item.all
    @whishlists = current_user.whishlists.where(event: params[:id])
    raise
  end

  def new
  end

  def create
    @event = Event.find(params[:event_id])
    @item = Item.find(params[:item])
    @whishlists = Whishlist.new
    @whishlists.event = @event
    @whishlists.item = @item
    @whishlists.quantity = 1
    @whishlists.save
    redirect_to event_whishlists_path
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
