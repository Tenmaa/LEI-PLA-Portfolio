class User::GamesController < ApplicationController
  def index
    @keyword = params[:keyword]
    if @keyword.present?
      @games = RakutenWebService::Books::Game.search(title: params[:keyword], outOfStockFlag: 1)
    else
      @games = RakutenWebService::Books::Game.search(booksGenreId: "006", sort: "sales")
    end
  end

  def show
    # @game = Game.find(params[:id])
    @game = RakutenWebService::Books::Game.search(jan: params[:id], outOfStockFlag: 1).first
    @comment = current_user.comments.new
    @comments = Comment.where(rakuten_jan_code: params[:id].to_i)
  end
  
  def create
    @game = current_user.games.new(game_params)
    @game.save
    redirect_to user_game_path(game.id)
  end
  
  def destroy
  end
  
  def search
    @games = RakutenWebService::Games::Game.search(title: "ポケモン")
    # render json: { status: 'success', data: @books }  
  end
  
 private
 
  def game_params
    params.require(:game).permit(:genre_id, :title, :package_image, :maker, :release_date, :amazon_url, :comment, :recommend_bgm, :recommend_bgm, game_hard_ids: [] )
  end

end
