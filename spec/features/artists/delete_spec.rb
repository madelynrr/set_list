require "rails_helper"

RSpec.describe "Delete an Artist", type: :feature do
  it "a user can delete an artist from the artist index" do
    dizzy = Artist.create(name: "Dizzy")

    visit "/artists"

    expect(page).to have_content(dizzy.name)
    expect(Artist.all.count).to eq(1)

    click_button("Delete Artist")

    expect(current_path).to eq("/artists")
    expect(page).to_not have_content(dizzy.name)
    expect(page).to_not have_content("Delete Artist")
    expect(Artist.all.count).to eq(0)
  end
end
