class PokeballsController < ApplicationController

  def create
    @pokemon = Pokemon.find(params[:pokemon_id])


    if succesfull_catch?
      @pokeball = Pokeball.new(pokeballs_params)
      @pokeball.pokemon = @pokemon
      @pokeball.trainer = Trainer.find(params[:pokeball][:trainer_id])
      if @pokeball.save
        redirect_to trainer_path(@pokeball.trainer), notice: 'Pokemon caught!'
      else
        render pokemon, status: :unprocessable_entity
      end
    else
      redirect_to root_path(@pokemons), status: :see_other
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

  def succesfull_catch?
    rand < 0.5
  end
end
