class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :description
      t.text :content
      t.references :user, null: false, default: 1
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
