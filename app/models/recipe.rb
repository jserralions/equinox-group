class Recipe < ActiveRecord::Base
  has_many :recipe_items
  has_many :ingredients, through: :recipe_items
  accepts_nested_attributes_for :ingredients
end
