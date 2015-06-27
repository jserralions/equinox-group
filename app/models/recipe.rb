class Recipe < ActiveRecord::Base
  has_many :recipe_items
  accepts_nested_attributes_for :recipe_items
end
