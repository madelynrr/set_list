require "rails_helper"

describe "Songs API V2", type: :request do
    it "sends a list of songs" do
        artist = Artist.create(name: "Taylor Swift")
        Song.create(title: "Peter", length: 220, play_count: 3, artist_id: artist.id)
        Song.create(title: "Red", length: 295, play_count: 5, artist_id: artist.id)
        Song.create(title: "Shake It Off", length: 219, play_count: 2, artist_id: artist.id)

        get "/api/v2/songs"

        expect(response).to be_successful

        songs = JSON.parse(response.body, symbolize_names: true)

        expect(songs.count).to eq(3)

        songs.each do |song|
            expect(song).to have_key(:id)
            expect(song[:id]).to be_an(Integer)

            expect(song).to have_key(:title)
            expect(song[:title]).to be_an(String)

            expect(song).to have_key(:length)
            expect(song[:length]).to be_an(Integer)

            expect(song).to have_key(:popularity)
            expect(song[:popularity]).to be_an(Integer)

            expect(song).to have_key(:artist_id)
            expect(song[:artist_id]).to be_an(Integer)

            expect(song).to_not have_key(:play_count)
        end
    end
end
