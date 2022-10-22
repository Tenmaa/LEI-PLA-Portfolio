class CreateCompatibles < ActiveRecord::Migration[6.1]
  def change
    create_table :compatibles do |t|
      t.references :game, null: false, foreign_key: true
      t.references :game_hard, null: false, foreign_key: true

      t.index [:game_id, :game_hard_id], unique: true
      t.timestamps
    end
  end
end
