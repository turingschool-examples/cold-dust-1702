require "rails_helper"

RSpec.describe "Chef show page" do

  it "displayes the chef, and the link to their ingredient page" do
    chef = Chef.create!(name: "Harold")
    pasta = chef.dishes.create!(name: "Pasta",
                                description: "Saucy noodles with parmesan",)
    sauce = pasta.ingredients.create!(name: "Pasta Sauce", calories: 200)
    noodles = pasta.ingredients.create!(name: "Wheat Noodles", calories: 50)
    parmesan = pasta.ingredients.create!(name: "Parmesan Cheese", calories: 40)
    lasagna = chef.dishes.create!(name: "Lasagna",
                                description: "Saucy noodles with parmesan, and sausage",)
    sauce = pasta.ingredients.create!(name: "Pasta Sauce", calories: 200)
    flat_noodles = pasta.ingredients.create!(name: "Flat Noodles", calories: 150)
    parmesan = pasta.ingredients.create!(name: "Parmesan Cheese", calories: 40)
    italian_sausage = pasta.ingredients.create!(name: "Italian Sausage", calories: 300)
    visit "/chefs/#{chef.id}"
    visit "/chefs/#{chef.id}"

    within '#chef-info' do
      expect(page).to have_content("Chef: Harold")
      expect(page).to have_content("Chef Ingredients")
    end

    click_on 'Chef Ingredients'

    expect(current_path).to eq("/chefs/#{chef.id}/ingredients")

    expect(page).to have_content("Pasta Sauce")
    expect(page).to have_content("Wheat Noodles")
    expect(page).to have_content("Parmesan Cheese")
    expect(page).to have_content("Flat Noodles")
    expect(page).to have_content("Italian Sausage")
  end
end
