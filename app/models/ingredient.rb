class Ingredient < ActiveRecord::Base
  validates_presence_of :name
  has_many :recipe_items
  has_many :recipes, through: :recipe_items
end
