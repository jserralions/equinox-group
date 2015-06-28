require 'rails_helper'

describe AllRecipesCom do
  subject(:recipe) { AllRecipesCom.new(url) }
  let(:url) { "http://allrecipes.com/Recipe/Slow-Cooker-Balsamic-Chicken/Detail.aspx?soid=recs_recipe_1"}

  context 'check recipe in www' do
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

  context "check recipe in local distro" do
    let(:url) { "#{::Rails.root}/spec/services/Slow-Cooker-Balsamic-Chicken.html" }

    it "should return name of recipe" do
      expect(recipe.parse[:name]).to eq "Slow Cooker Balsamic Chicken"
    end

    it "should return ingridient" do
      expect(recipe.parse[:ingredients].first).to include( {amount:"2",
        measure: "tablespoons", name: "olive oil"} )
    end
  end
end
