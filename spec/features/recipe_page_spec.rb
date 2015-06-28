require 'spec_helper'
require 'rails_helper'

feature "Seeing" do
  scenario "main page" do
    visit root_path
    expect(page).to have_content("Recipes")
  end

end