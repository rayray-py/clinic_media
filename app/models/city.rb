# == Schema Information
#
# Table name: cities
#
#  id            :integer          not null, primary key
#  name          :string(255)      not null
#  prefecture_id :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_cities_on_prefecture_id  (prefecture_id)
#

class City < ApplicationRecord
  belongs_to :prefecture
  has_many :clinics

  delegate :name, to: :prefecture, prefix: true
end
