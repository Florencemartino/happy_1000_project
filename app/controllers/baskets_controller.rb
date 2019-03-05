class BasketsController < ApplicationController
  before_action :authenticate_user!


  def index
    @event = Event.find(params[:event_id])
    @whishlists = Whishlist.where(event_id: params[:event_id])
    # @baskets = current_user.baskets.join(whishlists).where(whishlist: {event: @event})
    all_user_baskets = current_user.baskets
    @baskets = []
    all_user_baskets.each do |b|
      if b.event.id == @event.id
        @baskets << b
      end
    end
    # only select baskets where basket.event.id == @event.id
  end

  def update_price
    @event = Event.find(params[:event_id])
    @basket = Basket.find(params[:basket_id])
    @basket.quantity = 0
    @basket.price_in_cent = 0
  end

  def updated_price
    @event = Event.find(params[:event_id])
    @basket = Basket.find(params[:basket_id])
    @basket.update(basket_params)
    @basket.save
    redirect_to event_baskets_path(@event)
  end

  def create
    @event = Event.find(params[:event_id])
    @whishlist = Whishlist.find(params[:whishlist])
    @basket = Basket.new
    @basket.whishlist = @whishlist
    @basket.user = current_user
    @basket.quantity = 1
    @whishlist.quantity = @whishlist.quantity - @basket.quantity
    @basket.price_in_cent = 0
    if @basket.save && @whishlist.save
      respond_to do |format|
      format.html { redirect_to event_baskets_path(@event) }
      format.js
      end
    end
  end

  def update
    @event = Event.find(params[:event_id])
    @basket = Basket.find(params[:id])
    @whishlist = @basket.whishlist
    case params[:sens]
    when "1"
      @basket.quantity += 1
      @whishlist.quantity -= 1
    when "-1"
      @basket.quantity -= 1
      @whishlist.quantity += 1
    end

    if @basket.quantity != 0
      if @whishlist.save! && @basket.save!
        respond_to do |format|
          format.html { redirect_to event_baskets_path(@event) }
          format.js
        end
      end
    elsif @basket.quantity.zero?
      @basket.destroy
      if @whishlist.save!
        respond_to do |format|
          format.html { redirect_to event_baskets_path(@event) }
          format.js
        end
      end
    end
    # redirect_to event_baskets_path(@event)
  end

  def edit
    @basket = Basket.find(params[:id])
    @event = Event.find(params[:event_id])
  end


  # def show
  #   @basket = Basket.find(params[:id])
  #   @whishlist = @basket.whishlist
  # end

  # def destroy
  #   @event = Event.find(params[:event_id])
  #   @basket = Basket.find(params[:id])
  #   @basket.destroy
  #   redirect_to event_baskets_path(@event)
  # end

  def select_items
    @whishlists = Whishlist.all
  end

  private

  def basket_params
    params.require(:basket).permit(:price_in_cent, :quantity)
  end
end
