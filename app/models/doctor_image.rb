# == Schema Information
#
# Table name: doctor_images
#
#  id          :integer          not null, primary key
#  profile_url :text(65535)
#  doctor_id   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_doctor_images_on_doctor_id  (doctor_id)
#

class DoctorImage < ApplicationRecord
  belongs_to :doctor
end
