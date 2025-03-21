require "rails_helper"

RSpec.describe "songs index page", type: :feature do
    it "can see all songs with title, lengths, and playcounts" do
        artist_1 = Artist.create(name: "Glass Animals")
        artist_2 = Artist.create(name: "Taylor Swift")

        song_1 = Song.create(title: "Show Pony",
                             length: 208,
                             play_count: 12345,
                             artist: artist_1)
        song_2 = Song.create(title: "Peter",
                             length: 309,
                             play_count: 2345,
                             artist: artist_2)

        visit "/songs"

        expect(page).to have_content(song_1.title)
        expect(page).to have_content(song_1.length)
        expect(page).to have_content(song_1.play_count)

        expect(page).to have_content(song_2.title)
        expect(page).to have_content(song_2.length)
        expect(page).to have_content(song_2.play_count)
    end
end
