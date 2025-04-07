require "rails_helper"

describe "Songs API", type: :request do
    it "sends a list of songs" do
        artist = Artist.create(name: "Taylor Swift")
        Song.create(title: "Peter", length: 220, play_count: 3, artist_id: artist.id)
        Song.create(title: "Red", length: 295, play_count: 5, artist_id: artist.id)
        Song.create(title: "Shake It Off", length: 219, play_count: 2, artist_id: artist.id)

        get "/api/v1/songs"

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

            expect(song).to have_key(:play_count)
            expect(song[:play_count]).to be_an(Integer)

            expect(song).to have_key(:artist_id)
            expect(song[:artist_id]).to be_an(Integer)
        end
    end

    it "can get one song by its id" do
        artist = Artist.create(name: "Taylor Swift")
        song = Song.create(title: "Peter", length: 220, play_count: 3, artist_id: artist.id)

        get "/api/v1/songs/#{song.id}"

        response_song = JSON.parse(response.body, symbolize_names: true)

        expect(response).to be_successful

        expect(response_song).to have_key(:id)
        expect(response_song[:id]).to be_an(Integer)
        expect(response_song[:id]).to eq(song.id)

        expect(response_song).to have_key(:title)
        expect(response_song[:title]).to be_an(String)
        expect(response_song[:title]).to eq(song.title)

        expect(response_song).to have_key(:length)
        expect(response_song[:length]).to be_an(Integer)
        expect(response_song[:length]).to eq(song.length)

        expect(response_song).to have_key(:play_count)
        expect(response_song[:play_count]).to be_an(Integer)
        expect(response_song[:play_count]).to eq(song.play_count)

        expect(response_song).to have_key(:artist_id)
        expect(response_song[:artist_id]).to be_an(Integer)
        expect(response_song[:artist_id]).to eq(song.artist_id)
    end

    it "can create a new song" do
        artist = Artist.create(name: "Taylor Swift")

        song_params = {
            title: "Red",
            length: 200,
            play_count: 300,
            artist_id: artist.id
        }

        headers = { "CONTENT_TYPE" => "application/json"}

        post "/api/v1/songs", headers: headers, params: JSON.generate(song: song_params)

        created_song = Song.last

        expect(response).to be_successful
        expect(created_song.title).to eq(song_params[:title])
        expect(created_song.length).to eq(song_params[:length])
        expect(created_song.play_count).to eq(song_params[:play_count])
        expect(created_song.artist_id).to eq(artist.id)
    end

    it "can update an existing song" do
        artist = Artist.create(name: "Taylor Swift")
        original_song = Song.create(title: "Red", length: 220, play_count: 3, artist_id: artist.id)

        song_params = { title: "Red (Taylor's Version)" }
        headers = { "CONTENT_TYPE" => "application/json"}

        patch "/api/v1/songs/#{original_song.id}", headers: headers, params: JSON.generate(song: song_params)

        updated_song = Song.find(original_song.id)

        expect(response).to be_successful
        expect(updated_song.title).to_not eq(original_song.title)
        expect(updated_song.title).to eq(song_params[:title])
    end

    it "can destroy a song" do
        artist = Artist.create(name: "Taylor Swift")
        song = Song.create(title: "Red", length: 220, play_count: 3, artist_id: artist.id)

        expect(Song.song_count).to eq(1)

        delete "/api/v1/songs/#{song.id}"

        expect(response).to be_successful
        expect(Song.song_count).to eq(0)
        expect{
            Song.find(song.id)
        }.to raise_error(ActiveRecord::RecordNotFound)
    end
end
