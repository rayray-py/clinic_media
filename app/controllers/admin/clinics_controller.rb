class Admin::ClinicsController < Admin::Base
  before_action :set_clinic, only: [:edit, :update, :destroy]
  before_action :only_admin, only: :delete

  def index
  end

  def new
    @clinic = Clinic.new
  end

  def create
    @clinic = Clinic.new(clinic_params)

    if set_city && @clinic.save
      set_city.clinics << @clinic
      redirect_to edit_admin_clinic_path(@clinic), notice: "クリニックを新規作成しました"
    else
      flash[:notice] = "存在する地域名を正確に入力してください。"
      render :new
    end
  end

  def edit
  end

  def update
    @clinic.attributes = clinic_params
    if @clinic.save
      redirect_to admin_clinics_path, notice: "クリニック情報の更新が完了しました"
    else
      render :edit
    end
  end

  def destroy
    if @clinic.destroy
      redirect_to admin_clinics_path, notice: "クリニックを削除しました"
    else
      render :index
    end
  end

  def search
    q = Clinic.ransack(params[:q])
    result = q.result(distinct: true)
    @clinics = result.page(params[:page]).per(10)
  end

  private
    def clinic_params
      params.require(:clinic).permit(
        :name,
        :address,
        :site_url,
        :phone_number,
        :postal_code,
        :transportation,
        :holiday,
        :reservation,
        :credit_card,
        :office_hours,
        :medical_loan
      )
    end

    def set_city
      city_name = params.require(:clinic).permit(:city_id)[:city_id]
      City.find_by(name: city_name)
    end

    def set_clinic
      @clinic = Clinic.find(params[:id])
    end
end
