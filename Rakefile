require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.test_files = [File.expand_path('../test/test_lyrics_search.rb', __FILE__)]
end

desc "Run tests"
task :default => :test