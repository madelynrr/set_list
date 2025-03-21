require "rails_helper"

RSpec.describe Song, type: :model do
    describe "validations" do
        it { should validate_presence_of :title }
        it { should validate_presence_of :length }
        it { should validate_presence_of :play_count }
    end

    describe "relationships" do
        it { should belong_to :artist }
    end

    describe "class methods" do
        it ".song_count" do
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

            expect(Song.song_count).to eq(2)
        end
    end
end
