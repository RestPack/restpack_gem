namespace :db do
  desc "Creates a new migration"
  task :new_migration, :name do |t, args|
    name = args[:name] || ENV['name']

    unless name
      puts "Error: must provide name of migration to generate."
      puts "For example: rake #{t.name} name=migration_name"
      abort
    end

    create_migration(name)
  end
end

def create_migration(name)
  FileUtils.mkdir_p 'db/migrate'
  prefix = Time.now.strftime("%Y%m%d%H%M%S")
  path = "db/migrate/#{prefix}_#{name}.rb"

  File.open(path, "w") do |f|
    f.write(
%{class #{name.camelize} < ActiveRecord::Migration
  def change

  end
end})

    puts "Created #{path}"
  end
end
