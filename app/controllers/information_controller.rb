class InformationController < ApplicationController
  def privacy
  end

  def sitemap
    @categories = Category.all
  end
end
