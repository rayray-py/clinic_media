class AddColumnsToArticleImages < ActiveRecord::Migration[5.0]
  def change
    add_column :article_images, :alt, :string, null: false, default: "article_image"
  end
end
