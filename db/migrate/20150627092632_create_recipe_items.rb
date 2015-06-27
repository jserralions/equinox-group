class CreateRecipeItems < ActiveRecord::Migration
  def change
    create_table :recipe_items do |t|
      t.integer :recipe_id
      t.integer :ingredient_id
      t.string :amout
      t.string :measure

      t.timestamps null: false
    end
  end
end
