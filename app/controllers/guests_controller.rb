class GuestsController < ApplicationController

  def index
    @guests = Guest.all
    @guests = Event.find(params[:id]).users

  end


end


# 1.choisi le nom de la view
# 2.coder l'action du controller (à nommer en dehors du crud)
# 3.dans la view afficher les instances qui nous interessent
