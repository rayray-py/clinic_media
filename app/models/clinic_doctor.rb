# == Schema Information
#
# Table name: clinic_doctors
#
#  id         :integer          not null, primary key
#  clinic_id  :integer
#  doctor_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_clinic_doctors_on_clinic_id  (clinic_id)
#  index_clinic_doctors_on_doctor_id  (doctor_id)
#

class ClinicDoctor < ApplicationRecord
  belongs_to :clinic
  belongs_to :doctor
end
