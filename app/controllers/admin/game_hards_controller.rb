class Admin::GameHardsController < ApplicationController
  def index
    @game_hards = GameHard.all
  end
  
  def new
     @game_hard = GameHard.new
  end
  
  def create
    @game_hard = GameHard.new(hard_name_params)
    @game_hard.save
    redirect_to admin_game_hards_path
  end
  
  def destroy
    @game_hard = GameHard.find(params[:id])
    @game_hard.destroy
    redirect_to admin_game_hards_path
  end
  
  private
  
  def hard_name_params
    params.require(:game_hard).permit(:hard_name)
  end
end
