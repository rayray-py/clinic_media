class Admin::UsersController < Admin::Base
  before_action :set_user, only: [:edit, :update, :destroy]
  before_action :only_admin

  def index
    @users = User.order(:id).page(params[:page])
  end

  def new
    @user = User.new
    render 'form'
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to admin_users_path, notice: "管理者の作成が完了しました"
    else
      render :new
    end
  end

  def edit
    render 'form'
  end

  def update
    @user.attributes = user_params
    if @user.save
      redirect_to admin_users_path, notice: "管理者の編集が完了しました"
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
      redirect_to admin_users_path, notice: "管理者を削除しました"
    else
      render :index
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :status, :image, :image_cache, :password)
    end

    def set_user
      @user = User.find(params[:id])
    end
end
