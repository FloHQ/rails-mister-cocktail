class FixDoseModel < ActiveRecord::Migration[5.1]
  def change
    add_reference :doses, :cocktail, foreign_key: true
    add_column :doses, :description, :string
  end
end
