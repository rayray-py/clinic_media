class Admin::CategoriesController < Admin::Base
  before_action :set_category, only: [:show, :edit, :destroy, :update]
  before_action :only_admin

  def index
    @categories = Category.roots
  end

  def show
    @categories = @category.children
  end

  def new
    @category = Category.new
  end

  def create
    if children_category_params.present?
      category = Category.find(children_category_params[:category_id])
      @category = category.children.new(category_params)
      if @category.save
        redirect_to admin_category_path(category), notice: "新規カテゴリを作成しました"
      else
        redirect_to admin_category_path(category), alert: "名前を入力してください"
      end
    else
      @category = Category.new(category_params)
      if @category.save
        redirect_to admin_categories_path, notice: "新規カテゴリを作成しました"
      else
        redirect_to admin_categories_path, alert: "名前を入力してください"
      end
    end
  end

  def edit
  end

  def update
    @category.attributes = category_params
    if @category.root?
      if @category.save
        redirect_to admin_categories_path, notice: "カテゴリの編集が完了しました"
      else
        redirect_to admin_categories_path, alert: "名前を入力してください"
      end
    else
      if @category.save
        redirect_to admin_category_path(@category.parent), notice: "カテゴリの編集が完了しました"
      else
        redirect_to admin_category_path(@category.parent), alert: "名前を入力してください"
      end
    end
  end

  def destroy
    if @category.destroy
      redirect_to admin_categories_path, notice: "カテゴリを削除しました"
    else
      render :index
    end
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name)
    end

    def children_category_params
      params.require(:category).permit(:category_id)
    end
end
