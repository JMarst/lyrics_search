# frozen_string_literal: true

class LyricsSearch::SearchResults
  attr_reader :results

  def initialize(result, search_type)
    results = result.dig((search_type + '_response').to_sym, (search_type + '_result').to_sym, :search_lyric_result).
                     compact.select{|res| !res[:lyric_id].to_i.zero?}
    
    results.inject(@results = []){|results, result| results << SearchResult.new(result)} if results
  end
end

require_relative 'search_result'