require 'nokogiri'
require 'open-uri'
require_relative 'all_recipes_com'

class AllRecipesCrawler
  attr_reader :uri

  def initialize(uri)
    @uri = uri
  end

  def crawl
    categories = parse_categories(uri)

    recipes = []

    categories.each do |category|
      category_recipes = extract_recipes(category[:link])
      recipes << category_recipes
    end

    parsed_recipes = []

    if recipes.any?
      recipes.flatten.each do |recipe|
        parser = AllRecipesCom.new(recipe[:link])
        parsed_recipe = parser.parse
        parsed_recipes << parsed_recipe
      end
    end

    parsed_recipes
  end

  private
    def extract_recipes(link)
      page = Nokogiri::HTML(open(link))

      recipe_links = page.css('.recipe-info a[href*="/Recipe/"]').take(10)

      recipes = []

      recipe_links.each do |item|
        recipe = {}
        recipe[:link] = item['href'].include?('allrecipes.com') ? item['href'] : ('http://allrecipes.com' + item['href'])
        recipe[:name] = item.text
        recipes << recipe
      end

      recipes
    end

    def parse_categories(link)
      page = Nokogiri::HTML(open(link))
      categories = []

      links = page.css('.btn.bgActive.active .cat > li:not(:first-child) a')

      if links.any?
        links.each do |item|
          category = {}
          category[:link] = item['href'].include?('allrecipes.com') ? item['href'] : ('http://allrecipes.com' + item['href'])
          category[:name] = item.text
          categories << category
        end


        subcategories = []
        categories.each do |item|
          subcategories << parse_categories(item[:link])
        end

        categories << subcategories
      end

      categories.flatten
    end
end
