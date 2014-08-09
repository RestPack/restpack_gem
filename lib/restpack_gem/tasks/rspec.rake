task :default => :test

desc "Run the tests"
task :test do
  exec "bundle exec rspec"
end

namespace :test do
  desc "Open a test irb session"
  task :irb do
    exec "irb -r ./spec/spec_helper.rb"
  end
end
