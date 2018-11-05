module ArtistsHelper
  def display_artist(song)
    song.artist.nil? ? link_to("Add Artist", edit_song_path(song)) : link_to(song.artist_name, artist_path(song.artist))
  end

  def artist_select(song, artist)
    if params[:artist_id]
      "Artist: #{song.artist_name}"
      hidden_field_tag :artist_id, artist.id
    else
      select_tag :artist_id, options_from_collection_for_select(Artist.all, :id, :name), id: "song_artist_id"
    end
  end
end
