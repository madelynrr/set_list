require "rails_helper"

RSpec.describe Artist, type: :model do
    describe "validations" do
        it { should validate_presence_of :name }
    end

    describe "relationships" do
        it { should have_many :songs }
    end

    describe "instance methods" do
        it ".average_song_length" do
            artist_1 = Artist.create(name: "Glass Animals")

            song_1 = Song.create(title: "Show Pony",
                                 length: 255,
                                 play_count: 12345,
                                 artist: artist_1)
            song_2 = Song.create(title: "Creatures in Heaven",
                                 length: 221,
                                 play_count: 2345,
                                 artist: artist_1)

            expect(artist_1.average_song_length).to eq(238)
        end
    end
end
