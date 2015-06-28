require 'rails_helper'

describe GetAllRecipesComRecipeParams do
  before do
    uri = "http://www.recipe.com/huaraches-con-carnitas/"
    recipe = GetAllRecipesComRecipeParams.new(uri)
  end

  it "should return uri" do
    expect(recipe.uri).to eq uri
  end

  #it "should return ingridients" do
    #expect(recipe.parse).to
  #end

end
