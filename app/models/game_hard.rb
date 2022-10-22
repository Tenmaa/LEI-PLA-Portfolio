class GameHard < ApplicationRecord
  has_many :compatibles
  has_many :games, through: :compatibles
end
