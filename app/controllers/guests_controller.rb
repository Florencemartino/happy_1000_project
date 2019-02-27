class GuestsController < ApplicationController

  def index
    @guests = Guest.where(is_coming: true)
  end

end
