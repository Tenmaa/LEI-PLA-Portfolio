class Admin::GamesController < ApplicationController
 def index
     @games = Game.all
 end

 def new
     @game = Game.new
 end
 
 def show
  
 end
 
 def create
  @game = Game.new(game_params)
  @game.save
  redirect_to admin_games_path
 end
 
 def destroy
  
 end
 
 private


 def game_params
    params.require(:game).permit(:genre_id, :title, :package_image, :maker, :release_date, :game_hard, :amazon_url)
 end
end
