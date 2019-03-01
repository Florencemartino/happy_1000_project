class WhishlistsController < ApplicationController
  def index
    @items = Item.all
    @event = Event.find(params[:event_id])
    @whishlists = Whishlist.where(event_id: params[:event_id])
  end

  def new
  end

  def create
    @event = Event.find(params[:event_id])
    @item = Item.find(params[:item])
    @whishlist = Whishlist.new
    @whishlist.event = @event
    @whishlist.item = @item
    @whishlist.quantity = 1
    @user = current_user
    # @whishlist.user_id = current_user.id
    @whishlist.save

    redirect_to event_whishlists_path(@event)
  end

  def update
    @event = Event.find(params[:event_id])
    @whishlist = Whishlist.find(params[:id])
    case params[:sens]
    when "1"
      then @whishlist.quantity += 1
    when "-1"
      then @whishlist.quantity -= 1
    end
    @whishlist.save!
    redirect_to event_whishlists_path(@event)
  end

  def destroy
    @event = Event.find(params[:event_id])
    @whishlist = Whishlist.find(params[:id])
    @whishlist.destroy
    redirect_to event_whishlists_path(@event)
  end

  private

  def whislist_params
    params.require(:whishlist).permit(:quantity, :item_id, :event_id)
  end
end
