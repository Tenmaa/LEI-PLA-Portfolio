class AddRakutenJanCodeToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :rakuten_jan_code, :bigint, null: false
  end
end
