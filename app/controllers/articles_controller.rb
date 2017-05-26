class ArticlesController < ApplicationController
  add_breadcrumb 'トップ', "/"

  def index
    @articles = Article.published.order('updated_at desc').page(params[:page])

    # パンくずリスト
    add_breadcrumb '新着記事一覧', articles_path
  end

  def show
    @article = Article.find(params[:id])
    redirect_to root_path if @article.draft?

    # パンくずリスト
    direct_category = @article.categories.map{|category| category if category.is_childless?}.first

    direct_category.path.each do |category|
      add_breadcrumb category.name, category_path(category)
    end

    add_breadcrumb @article.title, article_path(@article)
  end
end
