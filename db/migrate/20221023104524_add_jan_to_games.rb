class AddJanToGames < ActiveRecord::Migration[6.1]
  def change
    add_column :games, :jan, :string
    add_column :games, :image_url, :string
    add_column :games, :caption, :string
    add_column :games, :hardware, :string
  end
end
