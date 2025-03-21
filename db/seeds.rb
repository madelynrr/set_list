# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Song.destroy_all
Artist.destroy_all

artist_1 = Artist.create(name: "Glass Animals")
artist_2 = Artist.create(name: "Taylor Swift")

Song.create(title: "Show Pony",
            length: 208,
            play_count: 12345,
            artist: artist_1)
Song.create(title: "Peter",
            length: 309,
            play_count: 2345,
            artist: artist_2)
