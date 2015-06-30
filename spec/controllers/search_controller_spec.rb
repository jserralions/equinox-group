require 'rails_helper'

RSpec.describe SearchController, type: :controller do
  # before :all do
  #   Recipe.create!(name: 'Tomato Soup', category: 'soups')
  #   Recipe.create!(name: 'Pepperoni Pizza', category: 'pizza')
  # end
  before { WebMock.allow_net_connect! }
  describe "returns queried items" do
    it "returns items by partial name" do
      Recipe.create!(name: 'Tomato Soup', category: 'soups')
      get :index, { name_query: 'Tomato Soup' }
      expect(controller.recipes.first).to eq('Tomato Soup')
    end
  end

end
