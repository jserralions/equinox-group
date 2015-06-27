class RecipeItem < ActiveRecord::Base
  has_many :ingredients
end
