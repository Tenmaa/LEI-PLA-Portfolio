class Admin::GamesController < ApplicationController
 skip_before_action :authenticate_user!
 before_action :authenticate_my_admin
 
 def index
     @games = Game.all
 end

 def new
     @game = Game.new
 end
 
 def show
     @game = Game.find(params[:id])
 end
 
 def create
  @game = Game.new(game_params)
  @game.save
  redirect_to admin_games_path
 end
 
 def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to admin_games_path
 end
 
 private


 def game_params
    params.require(:game).permit(:genre_id, :title, :package_image, :maker, :release_date, :amazon_url, game_hard_ids: [] )
 end
end
