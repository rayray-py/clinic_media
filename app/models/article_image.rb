# == Schema Information
#
# Table name: article_images
#
#  id         :integer          not null, primary key
#  image      :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  alt        :string(255)      default("article_image"), not null
#

class ArticleImage < ApplicationRecord
  include Rails.application.routes.url_helpers
  mount_uploader :image, ImageUploader
end
