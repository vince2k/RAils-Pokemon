class TrainersController < ApplicationController

  def index
    @trainers = Trainer.all
  end

  def show
    @trainer = Trainer.find(params[:id])
  end


  private

  def set_trainer
    @trainer = Trainer.find(params[:id])
  end
end
