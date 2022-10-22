class Game < ApplicationRecord
  belongs_to :genre
  has_many :compatibles, dependent: :destroy
  has_many :game_hards, through: :compatibles
  accepts_nested_attributes_for :game_hards, allow_destroy: true
  has_one_attached :package_image

end
