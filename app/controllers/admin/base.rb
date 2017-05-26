class Admin::Base < ApplicationController
  before_action :authenticate_user!
  layout "admin"

  private
    def only_admin
      redirect_to root_path, notice: 'アクセス権限がありません' unless current_user.admin?
    end
end
