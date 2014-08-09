task :default => :test
task :test => :spec

begin
  require "rspec/core/rake_task"

  desc "Run all specs"
  RSpec::Core::RakeTask.new(:spec) do |t|
    t.rspec_opts = ['-c']
  end
rescue LoadError
end

namespace :test do
  desc "Open a test irb session"
  task :irb do
    exec "irb -r ./spec/spec_helper.rb"
  end
end
