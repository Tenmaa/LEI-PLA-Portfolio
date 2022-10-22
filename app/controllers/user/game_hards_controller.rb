class User::GameHardsController < ApplicationController
  def index
    @games = Game.all
    @games_swi = GameHard.find_by(hard_name: "Switch").games
    @games_ps5= GameHard.find_by(hard_name: "PS5").games
    @games_ps4 = GameHard.find_by(hard_name: "PS4").games
    @games_pc = GameHard.find_by(hard_name: "PC").games
    @games_3ds = GameHard.find_by(hard_name: "3DS").games
  end
end
