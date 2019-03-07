class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
    # 2 cas : afficher les cartes des events auxquels on est invite, ET les evenements qu'on organise
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
      # redirect_to event_whishlists_path(@event.id)
      redirect_to event_select_guest_path(@event)
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
    # @baskets = Basket.where(user_id: current_user.id)
    @total = @event.baskets.sum(:price_in_cent).to_f.round(2)
    @baskets_per_user = @event.baskets.group_by { |basket| basket.user }
  end

  def select_guest
    @event = Event.find(params[:event_id])

  # BARRE SEARCH  BARRE SEARCH  BARRE SEARCH  BARRE SEARCH  BARRE SEARCH
    if params[:query].present?
      @guests = User.where("nickname ILIKE ?", "%#{params[:query]}%")
    else
      @guests = User.where.not(id: current_user.id)
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to :root
  end

  def account
    @event = Event.find(params[:event_id])
    @guests = @event.users + [@event.user]
    @whishlists = @event.whishlists
    @baskets = @event.baskets

    @total = @event.baskets.sum(:price_in_cent).to_f.round(2)
    @average = @total / @guests.count

    @baskets_per_user = @event.baskets.group_by { |basket| basket.user }

    @guests.each do |user|
      if @baskets_per_user[user].nil?
        @baskets_per_user[user] = [Basket.new(whishlist: @event.whishlists.first, user: user, quantity: 0, price_in_cent: 0)]
      end
    end

    @sum_per_person = {}
    @guests.each do |user|
      @sum_per_person[user] = 0
    end

    @difference_per_person = {}

    @baskets_per_user.each do |user, baskets|
      sum = baskets.sum { |basket| basket.price_in_cent }
      @sum_per_person[user] = sum
      @difference_per_person[user] = sum - @average
    end

    @balance_per_person = @difference_per_person.dup
    @refund_per_person = {}

    @users_sorted = @guests.sort_by { |user| @sum_per_person[user] }

    @users_sorted.reject { |user| @difference_per_person[user].positive? }.each do |user|
      user_to_refund = (@users_sorted - [user]).select do |u|
        @difference_per_person[u].positive?
      end
      user_to_refund.each do |refund|
        next if @difference_per_person[user] == 0

        total_refund = @difference_per_person[refund]
        debt = @difference_per_person[user]
        if (total_refund + debt).positive?
          @difference_per_person[refund] += debt
          @difference_per_person[user] = 0
          if @refund_per_person[user].nil?
            @refund_per_person[user] = { refund => (0 - debt) }
          else
            @refund_per_person[user][refund] = (0 - debt)
          end
        else
          @difference_per_person[refund] = 0
          @difference_per_person[user] = total_refund + debt
          if @refund_per_person[user].nil?
            @refund_per_person[user] = { refund => total_refund }
          else
            @refund_per_person[user][refund] = total_refund
          end
        end
      end
    end
    # if @difference == 0
    #   puts "tu n'as rien a payer"
    # elsif @difference > 0
    #   puts "on te doit des sous"
    # elsif @difference < 0
    #   puts "tu as des dettes"
    # end
  end

    # users_sorted => [User47, User46, User49, User48]
    # sum_per_user => {
    #   User47 => 0,
    #   User46 => 0,
    #   User49 => 10,
    #   User48 => 125
    # }

    # diff_per_user => {
    #   User47 => -36,25,
    #   User46 => -36,25,
    #   User49 => -3,75,
    #   User48 => 68,25
    # }

    # balance_per_user => {
    #   User47 => -36,25,
    #   User46 => -36,25,
    #   User49 => -3,75,
    #   User48 => 68,25
    # }

    # refund_per_person = {
    #   User47 => { User48 => 36.25 },
    #   User46 => { User48 => 32.5, User49 =>3.75 }
    # }
  private

  def event_params
    params.require(:event).permit(:title, :description, :address, :date)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end

