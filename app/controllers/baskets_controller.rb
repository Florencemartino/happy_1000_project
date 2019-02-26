class BasketsController < ApplicationController
  def index
    @whishlists = Whishlist.all
  end
end
