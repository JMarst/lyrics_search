# LyricsSearch

Lyrics search using the ChartLyrics SOAP API (http://www.chartlyrics.com/api.aspx)

## Installation and usage

```
 gem install lyrics_search
 gem install 'lyrics_search', '~> 0.1'
```

Make a search using either artist and song names:
```
search = LyricsSearch.new(artist: 'The Beatles', song: 'Hey Jude')
```
Or lyrical content:
```
search = LyricsSearch.new(lyrics: 'The movement you need is on your shoulder')
```

Retrieve the most relevant result:
```
search.get_result # => {:artist=>"The Beatles", :song=>"Hey Jude", :lyrics=> "Hey Jude, don't make it bad..."}
search.get_lyrics # => "Hey Jude, don't make it bad..."
```
Retrieve all results:
```
search.get_all_results
search.get_all_lyrics
```

Or get the raw output for all results, which includes other fields such as the album cover and lyric page URL:
```
search.get_raw_results
```

> [!NOTE]
> If there are no results, all the above methods will return a 'No results, please try different search terms' message. This can be customized by inheriting the LyricsSearch class and changing the @invalid_message class instance variable

## License (not including use of ChartLyrics API)

[MIT License](./MIT-LICENSE)

## ChartLyrics License

The ChartLyrics APIs are free for non-commercial use. If you are a non-commercial entity (eg. an individual) and you are not charging for your product, and the product has no other commercial purpose, then you can use the ChartLyrics APIs. Otherwise, you will require our written permission.