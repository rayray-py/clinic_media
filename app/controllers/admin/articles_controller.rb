class Admin::ArticlesController < Admin::Base
  before_action :set_article, only: [:edit, :update, :destroy]
  before_action :only_admin, only: :delete

  def index
    @articles = Article.order('id desc').page(params[:page])
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.new(article_params)

    set_category_to_article
    set_range_of_disclosure_of_article

    if @article.save
      redirect_to admin_articles_path, notice: "記事（#{@article.status_i18n}）の投稿が完了しました"
    else
      render :new
    end
  end

  def edit
  end

  def update
    @article.attributes = article_params

    set_category_to_article
    set_range_of_disclosure_of_article

    @article.status = params[:draft] ? 1 : 0

    if @article.save
      redirect_to admin_articles_path, notice: "記事（#{@article.status_i18n}）の更新が完了しました"
    else
      render :edit
    end
  end

  def destroy
    if @article.destroy
      redirect_to admin_articles_path, notice: "記事を削除しました"
    else
      render :index
    end
  end

  private
    def article_params
      params.require(:article).permit(:title, :description, :tag_list, :content, :image, :image_cache, :category_ids)
    end

    def set_article
      @article = Article.find(params[:id])
    end

    def set_category_to_article
      @categories = Category.where(id: params[:article][:category_ids].drop(1))
      category_ids = []
      @categories.each do |category|
        category_ids.push(category.id)
        category_ids += category.ancestor_ids
      end

      @article.category_ids = category_ids
    end

    def set_range_of_disclosure_of_article
      @article.status = params[:draft] ? 1 : 0
    end
end
