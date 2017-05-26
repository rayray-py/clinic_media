# == Schema Information
#
# Table name: clinics
#
#  id             :integer          not null, primary key
#  name           :string(255)      not null
#  address        :string(255)
#  site_url       :string(255)
#  phone_number   :string(255)
#  postal_code    :string(255)
#  transportation :text(65535)
#  holiday        :text(65535)
#  reservation    :text(65535)
#  credit_card    :text(65535)
#  office_hours   :text(65535)
#  medical_loan   :integer          default("0")
#  city_id        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_clinics_on_city_id  (city_id)
#

class Clinic < ApplicationRecord
  belongs_to :city
  has_one :group, through: :clinic_group
  has_one :clinic_group, dependent: :destroy
  has_many :clinic_doctors, dependent: :destroy
  has_many :doctors, through: :clinic_doctors
  #kaminari
  paginates_per 5
  validates :name, :address, :site_url, :phone_number, :postal_code, :transportation, :holiday, :reservation, :office_hours, :medical_loan, :credit_card, presence: true
  enum medical_loan: %i{no yes}

  delegate :name, to: :city, prefix: true

  def self.search(search)
    if search
      patterns = search.split(/[ ,　]/)
      sql_name = ''
      patterns.each do | pattern |
        sql_name += ' and ' unless sql_name.blank?
        sql_name += " name like '%#{pattern}%' "
      end
      sql = "select * from clinics where #{sql_name} order by id desc"
      clinic_ids = Clinic.find_by_sql(sql)
      ids = []
      clinic_ids.each do |qi|
        ids.push(qi.id)
      end
      where(id: ids)
    else
      Clinic.all
    end
  end
end
