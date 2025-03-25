require "rails_helper"

RSpec.describe "New Artist", type: :feature do
    describe "As a user" do
        describe "when I visit the new Artist form by clicking a link on the index" do
            it "can create a new Artist" do
                visit "/"
                click_link("Artist Index")

                expect(current_path).to eq("/artists")

                click_link("Add an Artist")

                expect(current_path).to eq("/artists/new")
                expect(page).to have_content("Add a New Artist")
                fill_in "Name", with: "Dizzy"

                click_on("Create Artist")

                expect(current_path).to eq("/artists")
                expect(page).to have_content("Dizzy")

                expect(Artist.all.count).to eq(1)
            end
        end
    end
  end
