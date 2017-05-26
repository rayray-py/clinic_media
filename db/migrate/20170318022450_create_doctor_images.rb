class CreateDoctorImages < ActiveRecord::Migration[5.0]
  def change
    create_table :doctor_images do |t|
      t.text :profile_url
      t.references :doctor, foreign_key: true
      t.timestamps
    end
  end
end
