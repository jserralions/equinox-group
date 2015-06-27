class Ingredient < ActiveRecord::Base
  has_many :recipe_item
end
