class ClinicsController < ApplicationController
  add_breadcrumb 'トップ', "/"

  def index
    @prefectures = sort_prefectures_by_region

    # パンくずリスト
    add_breadcrumb 'クリニックを探す', clinics_path
  end

  def show
    @clinic = Clinic.find(params[:id])

    # パンくずリスト
    add_breadcrumb 'クリニックを探す', clinics_path
    add_breadcrumb @clinic.city.prefecture_name, clinics_prefecture_path(@clinic.city.prefecture)
    add_breadcrumb @clinic.city_name, clinics_prefecture_city_path(@clinic.city.prefecture, @clinic.city)
    add_breadcrumb @clinic.name, clinic_path(@clinic)
  end

  private
    def sort_prefectures_by_region
      prefectures = []
      for i in 0..7
        prefectures << Prefecture.where(region: i)
      end
      prefectures
    end
end
