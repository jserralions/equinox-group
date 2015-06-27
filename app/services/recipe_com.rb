require 'nokogiri'
require 'open-uri'

class RecipeCom
  def initialize(uri)
    @doc = Nokogiri::HTML(open(uri))
  end
  
  def recipe_name
    @doc.css("h1[itemprop='name']").text
  end

  def recipe_items
    ingredients_list = @doc.css("#ingredientList li div div")

    recipe_items = []
    
    ingredients_list.each do |ingredient|
      full_desc = ingredient.text.gsub(/\s\s+/, ' ')
      
      tokens = full_desc.split(' ')
      recipe_item = {}
      recipe_item[:amout] = tokens.shift  # literowka !!!!
      recipe_item[:measure] = tokens.join(' ')
      recipe_items << ingredient
    end
    
    recipe_items
  end
end
