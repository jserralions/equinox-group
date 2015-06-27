class ReplaceMisspell < ActiveRecord::Migration
  def change
    rename_column :recipe_items, :amout, :amount
  end
end
