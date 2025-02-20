class PokeballsController < ApplicationController
  before_action :set_pokeball, only: [:create]

  def create
    @pokeball = Pokeball.new(pokeballs_params)
    @pokeball.trainer = Trainer.find(params[:pokeball][:trainer].to_i)
    @pokeball.pokemon = Pokemon.find(params[:pokemon_id])
    @pokeball.save
  end

  def destroy

  end

  private
  def pokeballs_params
    params.require(:pokeball).permit(:caught_on, :location)
  end

  def set_pokeball
    @pokeball = Pokeball.find(params[:pokemon_id])
  end
end
