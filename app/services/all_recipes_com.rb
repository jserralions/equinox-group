require 'nokogiri'
require 'open-uri'

class GetAllRecipesComRecipeParams
	attr_reader :uri
	
	def initialize(uri) 
		@uri = uri
	end

	def parse
		recipe_params = {}
		
		recipe_params[:name] = parse_name
		recipe_params[:ingredients] = parse_ingredients
		recipe_params
	end		

	private

	def doc 
		@doc ||= Nokogiri::HTML(open(uri))
	end

	def parse_name
		doc.css('#itemTitle').text
	end

	def parse_ingredients
		ingredients = []

		doc.css('.ingredient-wrap li').each do |item|
			amount_measure = item.css('.ingredient-amount').text.split(' ')

			ingredient = {}
			ingredient[:ammount] = amount_measure.shift
			ingredient[:measure] = amount_measure.join(' ')
			ingredient[:name] = item.css('.ingredient-name').text

			ingredients << ingredient
		end

		ingredients
	end
end