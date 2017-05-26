# == Schema Information
#
# Table name: articles
#
#  id            :integer          not null, primary key
#  title         :string(255)
#  description   :string(255)
#  content       :text(65535)
#  user_id       :integer          default("1"), not null
#  status        :integer          default("0"), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  helpful_count :integer          default("0"), not null
#  image         :string(255)
#
# Indexes
#
#  index_articles_on_user_id  (user_id)
#

class Article < ApplicationRecord
  mount_uploader :image, ImageUploader

  has_many :article_categories, dependent: :delete_all
  has_many :categories, through: :article_categories
  belongs_to :user

  acts_as_taggable
  paginates_per 20
  enum status: %i(published draft)

  validates :title, presence: true

  delegate :name, to: :user, prefix: true
end
