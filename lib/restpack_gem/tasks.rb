module RestPack::Gem
  class Tasks
    def self.load_tasks
      load "restpack_gem/tasks/gem.rake"
      load "restpack_gem/tasks/rspec.rake"
    end
  end
end
