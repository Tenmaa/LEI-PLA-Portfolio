class User::GenresController < ApplicationController
  def index
    @games = Game.all
    @games_adv = Genre.find_by(genre_name: "アドベンチャー").games
    @games_rpg = Genre.find_by(genre_name: "RPG").games
    @games_act = Genre.find_by(genre_name: "アクション").games
    @games_rce = Genre.find_by(genre_name: "レース").games
    @games_pzl = Genre.find_by(genre_name: "パズル").games
    @games_sim = Genre.find_by(genre_name: "シミュレーション").games
  end
end
