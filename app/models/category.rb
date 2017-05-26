# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  ancestry   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_categories_on_ancestry  (ancestry)
#

class Category < ApplicationRecord
  has_many :article_categories
  has_many :articles, through: :article_categories
  has_ancestry
  validates :name, presence: true
end
