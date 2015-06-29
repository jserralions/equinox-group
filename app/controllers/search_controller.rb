class SearchController < ApplicationController

  expose(:recipes) do
    search_recipes
  end

  def index
  end

  private

  def search_recipes
    # Recipe.search(params[:name_query]).results.to_a
    Recipe.where("name like ? OR category like ?", "%#{params[:name_query]}%", "%#{params[:name_query]}%")
  end
end
