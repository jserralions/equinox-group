require 'rails_helper'

describe AllRecipesCom do

    url = "http://www.recipe.com/huaraches-con-carnitas/"
    let(:recipe) { AllRecipesCom.new(url) }

  it "should return uri" do
    expect(recipe.uri).to eq url
  end

  #it "should return ingridients" do
    #recipe.params.should include()
  #end TODO

end
