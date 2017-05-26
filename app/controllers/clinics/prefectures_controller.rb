class Clinics::PrefecturesController < ApplicationController
  add_breadcrumb 'トップ', "/"

  def show
    @prefecture = Prefecture.find_by(kana: params[:kana])
    @cities = @prefecture.cities.includes(:clinics)
    @clinics = @prefecture.clinics.includes(:group).page(params[:page])

    # パンくずリスト
    add_breadcrumb 'クリニックを探す', clinics_path
    add_breadcrumb @prefecture.name, clinics_prefecture_path(@prefecture)
  end
end
