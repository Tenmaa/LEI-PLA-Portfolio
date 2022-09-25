class CreateGameHards < ActiveRecord::Migration[6.1]
  def change
    create_table :game_hards do |t|
      t.string :hard_name

      t.timestamps
    end
  end
end
