class RecipeItem < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :ingredient
  accepts_nested_attributes_for :ingredient,
                                reject_if: :all_blank
  validates_presence_of :amount, :measure
end
