class GuestsController < ApplicationController

  def index
    @guests = User.all
  end

  # def is_coming
  #   guest.is_coming == true
  #   # if guest = user.is_coming?
  # end

end

   # @guests = Event.find(params[:id]).users


    #   @guests = guest
    # else

# 1.choisi le nom de la view
# 2.coder l'action du controller (à nommer en dehors du crud)
# 3.dans la view afficher les instances qui nous interessent
