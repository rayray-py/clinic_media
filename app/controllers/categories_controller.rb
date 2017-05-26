class CategoriesController < ApplicationController
  add_breadcrumb 'トップ', "/"

  def index
    # パンくずリスト
    add_breadcrumb 'カテゴリ一覧', categories_path
  end

  def show
    @category = Category.find(params[:id])
    @articles = @category.articles.published.order('updated_at desc').page(params[:page])

    # パンくずリスト
    add_breadcrumb 'カテゴリ一覧', categories_path
    @category.path.each do |category|
      add_breadcrumb "#{category.name}に関する悩み・施術", category_path(category)
    end
  end
end
