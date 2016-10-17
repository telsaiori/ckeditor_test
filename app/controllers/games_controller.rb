class GamesController < ApplicationController
  before_action :find_game, only:[:show,:edit,:update,:destroy, :add_review]
  before_action :authenticate_user!, except: [:index, :show, :add_review]
  before_action :auth_user, except: [:index, :show]
  before_action :never_review?, only: [:add_review]

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
    if user_signed_in?
      @my_review = @game.comments.find_by(name: current_user.name)
    end
  end

  def add_review
    @review = @game.comments.build
    respond_to do |format|
      format.html
      format.js
    end
  end



  private

  def game_params
    params.require(:game).permit(:title,:os,:rating,:review,:company, :image)
  end

  def find_game
    @game = Game.includes(:comments).find(params[:id])
  end

  def never_review?
    if !!Game.find(params[:id]).comments.find_by(name: current_user.name)
      render nothing: true, status: 401
    end
  end


end
