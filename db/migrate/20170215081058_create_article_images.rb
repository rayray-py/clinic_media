class CreateArticleImages < ActiveRecord::Migration[5.0]
  def change
    create_table :article_images do |t|
      t.text :image

      t.timestamps
    end
  end
end
