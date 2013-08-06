require 'bump/tasks'

def gem_name
  Dir.pwd.split('/').last
end

namespace :RestPack do
  desc "Cut and release a new gem version"
  task :gem do
    puts "Releasing a new version of #{gem_name}"
    Rake::Task["RestPack:gem:bump"].invoke
    Rake::Task["RestPack:gem:tag"].invoke
    Rake::Task["RestPack:gem:build"].invoke
    Rake::Task["RestPack:gem:push"].invoke
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
  end
end
