class TagsController < ApplicationController
  def show
    @articles = Article.published.tagged_with(params[:name]).page(params[:pages])
  end
end
