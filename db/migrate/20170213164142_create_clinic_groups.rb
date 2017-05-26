class CreateClinicGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :clinic_groups do |t|
      t.references :clinic, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true
      t.timestamps
    end
  end
end
