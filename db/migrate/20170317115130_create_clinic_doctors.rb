class CreateClinicDoctors < ActiveRecord::Migration[5.0]
  def change
    create_table :clinic_doctors do |t|
      t.references :clinic, foreign_key: true
      t.references :doctor, foreign_key: true
      t.timestamps
    end
  end
end
