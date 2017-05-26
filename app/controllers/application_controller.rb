class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_side_variables

  def set_side_variables
    @root_categories = Category.roots
    @tags = ActsAsTaggableOn::Tag.most_used(6)
    @ranked_articles = Article.published.order('helpful_count desc').limit(5)
  end
end
