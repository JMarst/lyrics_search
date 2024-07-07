require "minitest/autorun"
require 'lyrics_search'

class LyricsSearchTest < Minitest::Test
  def test_search_by_artist_and_song
    search = LyricsSearch.new(artist: 'The Beatles', song: 'Hey Jude')
    assert_match(/take a sad song and make it better/i, search.get_lyrics)
  end

  def test_search_by_lyric_text
    search = LyricsSearch.new(lyrics: 'the movement you need is on your shoulder')
    assert_match(/take a sad song and make it better/i, search.get_lyrics)
  end
end