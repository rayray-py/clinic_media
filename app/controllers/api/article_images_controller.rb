class Api::ArticleImagesController < ApplicationController
  def create
    @article_image = ArticleImage.new(article_image_params)

    if @article_image.save
      render json: { alt: @article_image.alt, image_url: @article_image.image.url }
    else
      render json: { result: "エラー" }
    end
  end

  private
    def article_image_params
      params.require(:article_image).permit(:image, :alt)
    end
end
