require 'spec_helper'
require 'rails_helper'

feature "User can" do
  scenario "add new recipe" do
    user = create(:user)
    login_as(user, :scope => :user)
    visit new_recipe_path
    within('#new_recipe') do
      fill_in('Name', :with => 'MyRecipe')
      fill_in('Category', :with => 'MyCategory')
    end
    click_button 'Create Recipe'
    expect(page).to have_content 'MyRecipe'
  end

  xscenario "add new recipes with ingredients" do
    user = create(:user)
    login_as(user, :scope => :user)
    visit new_recipe_path
    within('#new_recipe') do
      fill_in('Name', :with => 'MyRecipe')
      fill_in('Category', :with => 'MyCategory')
      fill_in('Ingredient name', :with => 'MyIngredient')
      fill_in('Ingredient name', :with => 'MyIngredient')
      fill_in('Ingredient name', :with => 'MyIngredient')
    end
    click_button 'Create Recipe'
  end
end