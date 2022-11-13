class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :game
  validates :rakuten_jan_code, presence: true
  validates :evaluation, presence: true
  validates :recommend_bgm, presence: true
  validates :comment, presence: true

  
end
