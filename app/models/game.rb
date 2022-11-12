class Game < ApplicationRecord
  belongs_to :genre, optional: true
  has_many :compatibles, dependent: :destroy
  has_many :game_hards, through: :compatibles
  accepts_nested_attributes_for :game_hards, allow_destroy: true
  has_one_attached :package_image
  has_many :comments, dependent: :destroy

end
