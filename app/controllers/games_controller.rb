class GamesController < ApplicationController
  before_action :find_game, only:[:show,:edit,:update,:destroy]

  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      redirect_to game_path(@game), notice: "新增成功"
    else
      render action: "new"
    end
  end

  def edit
  end

  def update
    if @game.update(game_params)
      redirect_to game_path(@game), notice: "修改成功"
    else
      render action: "edit"
    end

  end

  def destroy
    if @game.destroy
      redirect_to games_path, notice: "刪除成功"
    end
  end

  def show
    @game = Game.find(params[:id])
  end

  private

  def game_params
    params.require(:game).permit(:title,:os,:rating,:review,:company)
  end

  def find_game
    @game = Game.find(params[:id])
  end

end
