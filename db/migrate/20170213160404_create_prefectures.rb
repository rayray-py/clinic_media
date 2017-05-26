class CreatePrefectures < ActiveRecord::Migration[5.0]
  def change
    create_table :prefectures do |t|
    t.string :name, null: false
    t.string :kana, null: false
    t.integer :region, null: false
    t.timestamps
    end
  end
end
