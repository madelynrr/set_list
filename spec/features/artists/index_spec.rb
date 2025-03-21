require "rails_helper"

RSpec.describe "artist index page", type: :feature do
  it "can see all artists" do
    Artist.create(name: "Glass Animals")
    Artist.create(name: "Taylor Swift")

    visit "/"
    click_on("Artist Index")

    expect(current_path).to eq("/artists")
    expect(page).to have_content("Artist Index")
    expect(page).to have_content("Glass Animals")
    expect(page).to have_content("Taylor Swift")
  end
end
