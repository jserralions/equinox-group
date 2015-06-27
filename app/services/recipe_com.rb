require 'nokogiri'
require 'open-uri'


class GetRecipeComContent
  def self.parse(uri)
    @doc = Nokogiri::HTML(open(uri))
    recipe_com = {}
    recipe_com[:name] = @doc.css("h1[itemprop='name']").text

    recipe_items = []
    
    ingredients_list = @doc.css("#ingredientList li div div")
    ingredients_list.each do |ingredient|
      full_desc = ingredient.text.gsub(/\s\s+/, ' ')
      
      tokens = full_desc.split(' ')
      recipe_item = {}
      recipe_item[:amout] = tokens.shift  # misspelled in model !!!!
      recipe_item[:measure] = tokens.join(' ')
      recipe_items << ingredient
    end

  end
end


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
      recipe_item[:amout] = tokens.shift  # misspell in model !!!!
      recipe_item[:measure] = tokens.join(' ')
      recipe_items << ingredient
    end
    
    recipe_items
  end
end
