class SearchController < ApplicationController
  def index
    @keyword =  params[:q][:title_or_content_cont]
    q = Article.published.ransack(params[:q])
    result = q.result(distinct: true)
    @articles = result.page(params[:page])
  end
end
