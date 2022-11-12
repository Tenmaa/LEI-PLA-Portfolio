class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.string :title, null: false
      t.string :maker, null: false
      t.string :release_date, null: false
      t.string :bgm
      t.references :genre, foreign_key: true

      t.timestamps
    end
  end
end
