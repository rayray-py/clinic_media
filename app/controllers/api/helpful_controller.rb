class Api::HelpfulController < ApplicationController
  def create
    article = Article.find(params[:article_id])
    article.helpful_count += 1
    article.save
    cookies.permanent["cliniclist_helpful_button_#{article.id}"] = true

    render json: { result: "success" }
  end
end
