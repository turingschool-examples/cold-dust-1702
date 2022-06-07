require "rails_helper"

RSpec.describe "Dish show page" do


  it "displays the info for a specific dish" do
    chef = Chef.create!(name: "Harold")
    pasta = chef.dishes.create!(name: "Pasta",
                                description: "Saucy noodles with parmesan",)
    sauce = pasta.ingredients.create!(name: "Pasta Sauce", calories: 200)
    noodles = pasta.ingredients.create!(name: "Wheat Noodles", calories: 50)
    parmesan = pasta.ingredients.create!(name: "Parmesan Cheese", calories: 40)

    visit "/chefs/#{chef.id}/dishes/#{pasta.id}"

    within "#dish-info" do
      expect(page).to have_content("Dish: Pasta")
      expect(page).to have_content("Description: Saucy noodles with parmesan")
      expect(page).to have_content("Chef: Harold")
    end

    within "#dish-#{sauce.id}" do
      expect(page).to have_content("Pasta Sauce")
      expect(page).to have_content("Calories: 200")
    end

    within "#dish-#{noodles.id}" do
      expect(page).to have_content("Wheat Noodles")
      expect(page).to have_content("Calories: 50")
    end
    within "#dish-#{parmesan.id}" do
      expect(page).to have_content("Parmesan Cheese")
      expect(page).to have_content("Calories: 40")
    end
  end

  it 'displays total calorie count for that dish' do
    chef = Chef.create!(name: "Harold")
    pasta = chef.dishes.create!(name: "Pasta",
                                description: "Saucy noodles with parmesan",)
    sauce = pasta.ingredients.create!(name: "Pasta Sauce", calories: 200)
    noodles = pasta.ingredients.create!(name: "Wheat Noodles", calories: 50)
    parmesan = pasta.ingredients.create!(name: "Parmesan Cheese", calories: 40)

    visit "/chefs/#{chef.id}/dishes/#{pasta.id}"

    within '#dish-info' do
      expect(page).to have_content("Total Calories: 290")
    end
  end
end
