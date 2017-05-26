# == Schema Information
#
# Table name: doctors
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  kana       :string(255)      not null
#  career     :text(65535)      not null
#  position   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Doctor < ApplicationRecord
  has_many :clinic_doctors, dependent: :destroy
  has_many :clinics, through: :clinic_doctors
  has_one :doctor_image
end
