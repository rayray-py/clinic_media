class HomeController < ApplicationController
  def index
    @articles = Article.published.order('updated_at desc').limit(5)
    @clinics = Clinic.includes(:group).where(id: [766, 767, 538, 1213, 635])
  end
end
