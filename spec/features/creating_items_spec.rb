require "rails_helper"

RSpec.feature "Creating Items" do
    scenario "creating a item successfully" do
        visit "/items"
        click_link "New item"
        fill_in "Name", with: "Pear"
        fill_in "Price", with: 30
        click_button "Create Item"

        expect(page).to have_content("Item was successfully created.")
    end

    scenario "creating a item without a cost" do
        visit "/items"
        click_link "New item"
        fill_in "Name", with: "Gum"
        click_button "Create Item"

        expect(page).to have_content("1 error prohibited this item from being saved:")
        expect(page).to have_content("Price is not a number")
    end
end