class AddAmazonUrlToGames < ActiveRecord::Migration[6.1]
  def change
    add_column :games, :amazon_url, :string
  end
end
