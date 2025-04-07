class AddPopularityToSongs < ActiveRecord::Migration[7.1]
  def change
    add_column :songs, :popularity, :string
  end
end
