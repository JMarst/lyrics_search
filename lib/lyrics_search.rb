# frozen_string_literal: true

require 'savon'

class LyricsSearch
  CHARTLYRICS_CLIENT = Savon.client(wsdl: 'http://api.chartlyrics.com/apiv1.asmx?WSDL')

  attr_reader :search_results

  @invalid_message = 'No results, please try different search terms'
  class << self
    attr_accessor :invalid_message
  end

  def initialize(options = {})
    @artist, @song, @lyrics = options.values_at(:artist, :song, :lyrics)
    
    begin
      search_type = "search_lyric#{'_text' if @lyrics}"
      @search_results = SearchResults.new(CHARTLYRICS_CLIENT.call(
                                          search_type.to_sym, message: {artist: @artist, song: @song, lyric_text: @lyrics}).body,
                                          search_type)

      if search_results.results
        instance_eval do
          def get_result; search_results.results.first.get_result; end
          def get_all_results; search_results.results.map(&:get_result); end
          def get_lyrics; search_results.results.first.lyrics; end
          def get_all_lyrics; search_results.results.map(&:lyrics); end
          def get_raw_results; search_results.results.map(&:raw_result); end
        end
      end
    rescue
      self.class.invalid_message
    end
  end

  def method_missing(m, *args, &block)
    self.class.invalid_message
  end
end

require_relative 'lyrics_search/search_results'