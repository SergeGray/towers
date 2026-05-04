class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      redirect_to @game, notice: "Game created successfully"
    end
  end

  private

  def game_params
    params.require(:game).permit(:first_player_turn)
  end
end
