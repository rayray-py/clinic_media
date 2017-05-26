class CreateDoctors < ActiveRecord::Migration[5.0]
  def change
    create_table :doctors do |t|
      t.string :name, null: false
      t.string :kana, null: false
      t.text :career, null: false
      t.string :position
      t.timestamps
    end
  end
end
