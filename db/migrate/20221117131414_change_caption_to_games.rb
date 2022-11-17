class ChangeCaptionToGames < ActiveRecord::Migration[6.1]
    def up
    change_table :games do |t|
      t.change :caption, :text
    end
  end

  def down
    change_table :games do |t|
      t.change :caption, :string
    end
  end
end