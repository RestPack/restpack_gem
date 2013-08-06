def gem_name
  Dir.pwd.split('/').last
end

desc "Bump, tag, build and release [#{gem_name}]"
task :gem do
  require 'bump/tasks'
  puts "Releasing a new version of [#{gem_name}]"
  Rake::Task["gem:bump"].invoke
  Rake::Task["gem:tag"].invoke
  Rake::Task["gem:build"].invoke
  Rake::Task["gem:push"].invoke
  Rake::Task["gem:cleanup"].invoke
end

namespace :gem do
  task :build do
    sh "gem build #{gem_name}.gemspec"
  end

  task :push do
    require 'bump'
    sh "gem push #{gem_name}-#{Bump::Bump.current}.gem"
  end

  task :tag do
    require 'bump'
    version = Bump::Bump.current
    puts "tagging v#{version}"
    `git push && git tag v#{version} && git push --tags`
  end

  task :bump do
    Rake::Task["bump:patch"].invoke
  end

  task :cleanup do
    Dir.glob("#{Dir.pwd}/*.gem").each { |f| File.delete(f) }
  end
end
