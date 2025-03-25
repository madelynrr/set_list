require "rails_helper"

RSpec.describe "Delete an Artist", type: :feature do
  it "a user can delete an artist from the artist index" do
    dizzy = Artist.create(name: "Dizzy")

    visit "/artists"

    expect(page).to have_content("Dizzy")

    click_on("Delete Artist")

    expect(current_path).to eq("/artists")
    expect(page).not_to have_content("Dizzy")
  end
end
