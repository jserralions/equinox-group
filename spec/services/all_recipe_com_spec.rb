require 'rails_helper'

describe AllRecipesCom do

    url = "http://allrecipes.com/Recipe/Slow-Cooker-Balsamic-Chicken/Detail.aspx?soid=recs_recipe_1"
    let(:recipe) { AllRecipesCom.new(url) }

  it "should return uri" do
    expect(recipe.uri).to eq url
  end

  it "should return name of recipe" do
    expect(recipe.parse[:name]).to eq "Slow Cooker Balsamic Chicken"
  end

  it "should return ingridient" do
    expect(recipe.parse[:ingredients].first).to include( {amount:"2",
      measure: "tablespoons", name: "olive oil"} )
  end

end
