class BasketsController < ApplicationController
  def select_items
    @whishlists = Whishlist.all
  end
end
