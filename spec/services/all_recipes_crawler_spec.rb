require 'rails_helper'

describe AllRecipesCrawler do
  before do
    stub_request(:get, "http://allrecipes.com/Recipes/Appetizers-and-Snacks/Snacks/Chips").
    to_return(:body => File.open("#{::Rails.root}/spec/services/snackchip.html").read)

    stub_request(:get, "http://allrecipes.com/Recipes/Appetizers-and-Snacks/Snacks/Chips/Kale-Chips").
    to_return(:body => File.open("#{::Rails.root}/spec/services/kalechips.html").read)

    stub_request(:get, "http://allrecipes.com/Recipes/Appetizers-and-Snacks/Snacks/Chips/Potato-Chips").
    to_return(:body => File.open("#{::Rails.root}/spec/services/potatochips.html").read)

    stub_request(:get, "http://allrecipes.com/Recipe/Potato-Chips").
    to_return(:body => File.open("#{::Rails.root}/spec/services/potatochipsrecipe.html").read)

    stub_request(:get, "http://allrecipes.com/Recipe/Kale-Chips").
    to_return(:body => File.open("#{::Rails.root}/spec/services/kalechipsrecipe.html").read)
  end

  subject(:crawler) { AllRecipesCrawler.new(url) }
  context "check crawler on local recipes" do
    let(:url) { "http://allrecipes.com/Recipes/Appetizers-and-Snacks/Snacks/Chips" }

    it "should have 2 elements" do
      expect(crawler.crawl.length).to eq 2
    end
  end
end
