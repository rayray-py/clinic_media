# == Schema Information
#
# Table name: prefectures
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  kana       :string(255)      not null
#  region     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Prefecture < ApplicationRecord
  has_many :cities
  has_many :clinics, through: :cities
  enum region: %i{北海道・東北 関東 北信越 東海 関西 中国 四国 九州・沖縄}

  def to_param
    kana
  end
end
