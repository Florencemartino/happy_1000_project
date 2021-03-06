class WhishlistsController < ApplicationController
  def index
    @items = Item.all
    @event = Event.find(params[:event_id])
    @whishlists = Whishlist.where(event_id: params[:event_id])

    @whishlists_per_item = {}
    @whishlists.each do |whishlist|
      @whishlists_per_item[whishlist.item] = whishlist
    end
  end

  def new
  end

  def create
    @event = Event.find(params[:event_id])
    @item = Item.find(params[:item])
    @whishlist = Whishlist.where(event_id: @event.id, item_id: @item.id).first_or_initialize

    # @whishlist.event = @event
    # @whishlist.item = @item
    @whishlist.quantity ||= 0
    @whishlist.quantity += 1

    @user = current_user

    # @whishlist.user_id = current_user.id
    if @whishlist.save
      respond_to do |format|
        format.html { redirect_to event_whishlists_path(@event) }
        format.js
      end
    end
  end

  # def update
  #   @event = Event.find(params[:event_id])
  #   @item = Item.find(params[:item])
  #   @whishlist = Whishlist.find(params[:id])
  #   @whishlist.quantity = 1
  #   if params[:sens] == "1"
  #     @whishlist.quantity += 1
  #   end
  #   if @whishlist.save
  #     respond_to do |format|
  #       format.html { redirect_to event_whishlists_path(@event) }
  #       format.js
  #     end
  #   end
  # end

  # def destroy
  #   # @event = Event.find(params[:event_id])
  #   @whishlist = Whishlist.find(params[:id])
  #   @whishlist.destroy
  #   # redirect_to event_whishlists_path(@event)
  # end

  private

  def whislist_params
    params.require(:whishlist).permit(:quantity, :item_id, :event_id)
  end
end
