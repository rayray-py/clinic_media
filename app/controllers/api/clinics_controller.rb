class Api::ClinicsController < ApplicationController
  def search
    @clinics = Clinic.search(params[:q]).order(:id).limit(10)
    render
  end

  def insert
    clinic = Clinic.find(clinic_data_params[:clinic_id])

    render json: { clinic_name: clinic.name, clinic_id: clinic.id, site_url: clinic.site_url, treatment_name: clinic_data_params[:name], treatment_price: clinic_data_params[:price]}
  end

  private
    def clinic_data_params
      params.require(:treatment).permit(:clinic_id, :name, :price)
    end
end
