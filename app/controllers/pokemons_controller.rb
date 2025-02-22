class PokemonsController < ApplicationController

  def index
    @pokemons = Pokemon.all
  end

  def show
    @pokemon = Pokemon.find(params[:id])
    @pokeball = Pokeball.new
  end

  def search
    if params[:query].present?
      @pokemons = Pokemon.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @pokemons = Pokemon.all
    end
    render :index
  end

  def random
    @pokemon = Pokemon.all.sample
    if @pokemon
      redirect_to pokemon_path(@pokemon)
    else
      redirect_to root_path, alert: "No Pokémon available."
    end
  end

end
