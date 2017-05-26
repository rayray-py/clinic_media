class AddAncestryToCategories < ActiveRecord::Migration[5.0]
  def change
    add_index :categories, :ancestry
  end
end
