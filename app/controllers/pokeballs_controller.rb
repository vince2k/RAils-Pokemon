class PokeballsController < ApplicationController

  def create
    @pokemon = Pokemon.find(params[:pokemon_id])
    @pokeball = Pokeball.new(pokeballs_params)
    @pokeball.pokemon = @pokemon
    @pokeball.trainer = Trainer.find(params[:pokeball][:trainer_id])

    if @pokeball.save
      redirect_to trainer_path(@pokeball.trainer), notice: 'Pokemon caught!'
    else
      render 'pokemons/show', status: :unprocessable_entity
    end
  end


  def destroy
    @pokeball = Pokeball.find(params[:id])
    @pokeball.destroy
    redirect_to trainer_path(@pokeball.trainer), notice: 'Pokéball released.'
  end

  private

  def pokeballs_params
    params.require(:pokeball).permit(:caught_on, :location, :trainer_id)
  end

end
