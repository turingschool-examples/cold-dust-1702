require 'rails_helper'

RSpec.describe "Chef#Show" do
  it "displays the name of the chef" do
    chef = Chef.create!(name: "Julia Adults")

    visit chef_path(chef)

    expect(page).to have_content("Name: Julia Adults")
  end

  it "has a link to ingredients index" do
    chef = Chef.create!(name: "Julia Adults")

    visit chef_path(chef)

    expect(page).to have_link("All Ingredients")
    click_link("All Ingredients")

    expect(current_path).to eq(chef_ingredients_path(chef))
  end
end
