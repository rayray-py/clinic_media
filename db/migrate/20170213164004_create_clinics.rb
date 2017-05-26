class CreateClinics < ActiveRecord::Migration[5.0]
  def change
    create_table :clinics do |t|
      t.string :name, null: false
      t.string :address
      t.string :site_url
      t.string :phone_number
      t.string :postal_code
      t.text :transportation
      t.text :holiday
      t.text :reservation
      t.text :credit_card
      t.text :office_hours
      t.integer :medical_loan, default: 0
      t.references :city, foreign_key: true
      t.timestamps
    end
  end
end
