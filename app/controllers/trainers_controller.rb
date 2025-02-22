class TrainersController < ApplicationController

  def index
    @trainers = Trainer.all
  end

  def show
    @trainer = Trainer.find(params[:id])
  end

  def new
    
  end

  def create

  end

  private

  def set_trainer
    @trainer = Trainer.find(params[:id])
  end
end
