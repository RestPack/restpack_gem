module RestPack::Gem
  class Tasks
    def self.load_tasks
      load "restpack_gem/tasks/gem.rake"
      load "restpack_gem/tasks/rspec.rake"
    end

    def self.load_service_tasks
      self.load_tasks
      load "restpack_gem/tasks/db.rake"
    end
  end
end
