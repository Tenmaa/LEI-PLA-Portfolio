# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# ジャンルモデルのデータを作る
# Genre.create!(
#   genre_name: "アクション",
# )
# Genre.create!(
#   genre_name: "RPG",
# )
# Genre.create!(
#   genre_name: "シューティング",
# )

# # ゲーム機モデルのデータを作る
# GameHard.create!(
#   hard_name: "PS5",
# )
# GameHard.create!(
#   hard_name: "Nintendo Switch",
# )
# GameHard.create!(
#   hard_name: "PS4",
# )

Admin.create!(
   email: 'admin@admin',
   password: 'testtest'
)