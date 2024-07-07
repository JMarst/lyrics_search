# frozen_string_literal: true

require_relative 'lib/lyrics_search/version'

Gem::Specification.new do |s|
  s.name = 'lyrics_search'
  s.homepage = 'https://github.com/JMarst/lyrics_search'
  s.authors = ["Jon Marston"]
  s.version = LyricsSearch::VERSION
  s.files = Dir['lib/**/*'] + %w(README.md MIT-LICENSE)
  s.test_files = Dir['test/**/*']
  s.require_path = 'lib'
  s.summary = 'Retrieve lyrics with the ChartLyrics API'
  s.description = s.summary
  s.metadata = {
    "homepage_uri" => s.homepage,
    "source_code_uri" => s.homepage
  }
  s.add_dependency 'savon', '~> 2.15.0'
  s.add_development_dependency 'rake'
  s.required_ruby_version = '>= 3.1.0'
  s.license = 'MIT'
end