class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      
      t.string :comment
      t.string :recommend_bgm
      t.float :evaluation, null: true
      t.references :user, null: false, foreign_key: true
      t.references :game, null: false, foreign_key: true



      t.timestamps
    end
  end
end
