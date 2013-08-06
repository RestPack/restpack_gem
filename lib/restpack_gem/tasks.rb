module RestPack::Gem
  class Tasks
    def self.load_tasks
      load "restpack_gem/tasks/gem.rake"
    end
  end
end
