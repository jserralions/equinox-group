require 'elasticsearch/model'

class Recipe < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  belongs_to :user
  has_many :recipe_items, dependent: :destroy
  has_many :ingredients, through: :recipe_items
  accepts_nested_attributes_for :recipe_items,
                                reject_if: :all_blank,
                                allow_destroy: true
  accepts_nested_attributes_for :ingredients
  validates_presence_of :name, :category

  mount_uploader :image, ImageUploader


  class << self
    delegate :search, to: :__elasticsearch__ unless respond_to?(:search)
  end

end

Recipe.import
