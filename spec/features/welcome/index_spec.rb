require "rails_helper"

RSpec.describe "root welcome page", type: :feature do
    it "has a root welcome page" do
        visit "/"

        expect(page).to have_content("Welcome to SetList")
        expect(page).to have_link("Song Index")
        expect(page).to have_link("Artist Index")
    end
end
