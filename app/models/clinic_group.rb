# == Schema Information
#
# Table name: clinic_groups
#
#  id         :integer          not null, primary key
#  clinic_id  :integer          not null
#  group_id   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_clinic_groups_on_clinic_id  (clinic_id)
#  index_clinic_groups_on_group_id   (group_id)
#

class ClinicGroup < ApplicationRecord
  belongs_to :clinic
  belongs_to :group
end
