class Clinics::CitiesController < ApplicationController
  add_breadcrumb 'トップ', "/"

  def show
    @city = City.find(params[:id])
    @clinics = @city.clinics.includes(:group).page(params[:page])

    # パンくずリスト
    add_breadcrumb 'クリニックを探す', clinics_path
    add_breadcrumb @city.prefecture_name, clinics_prefecture_path(@city.prefecture)
    add_breadcrumb @city.name, clinics_prefecture_city_path(@city.prefecture, @city)
  end
end
