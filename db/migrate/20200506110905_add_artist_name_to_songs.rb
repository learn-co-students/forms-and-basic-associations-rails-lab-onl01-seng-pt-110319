class AddArtistNameToSongs < ActiveRecord::Migration[5.0]
  def change
    change_table :songs do |t|
      t.string :artist_name
    end
  end
end
