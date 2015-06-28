class SearchController < ApplicationController

  expose(:recipes) do
    search_recipes
  end

  def index
  end

  def search_recipes
    Recipe.search(params[:name_query]).results.to_a
  end
end
