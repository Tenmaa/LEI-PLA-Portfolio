class Game < ApplicationRecord
  belongs_to :genre
  belongs_to :game_hard
  has_one_attached :package_image
end
