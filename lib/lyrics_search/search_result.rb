class LyricsSearch::SearchResults::SearchResult
  attr_reader :raw_result, :artist, :song, :lyrics

  def initialize(result)
    @artist, @song, @lyric_id, @lyric_checksum = result.values_at(:artist, :song, :lyric_id, :lyric_checksum)
    
    @raw_result = LyricsSearch::CHARTLYRICS_CLIENT.call(:get_lyric, message: {lyric_id: @lyric_id, lyric_check_sum: @lyric_checksum}).
                                                   body.dig(:get_lyric_response, :get_lyric_result)

    @lyrics = @raw_result[:lyric]
  end

  def get_result
    {artist: artist, song: song, lyrics: lyrics}
  end
end