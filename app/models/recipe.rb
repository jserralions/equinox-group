class Recipe < ActiveRecord::Base
  has_many :ingredients, through: :recipe_items
  accepts_nested_attributes_for :ingredients
  belongs_to :user
end
