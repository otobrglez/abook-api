require './boot.rb'

include ActiveRecord::Tasks

DatabaseTasks.env = ABOOK_ENV.to_s
=begin
DatabaseTasks.database_configuration = YAML.load(
    ERB.new(
        File.read(ABOOK_PATH.join('./config/database.yml').to_s)
    ).result
)
=end

DatabaseTasks.database_configuration = YAML.load_file('./config/database.yml')

root = File.expand_path '..', __FILE__

DatabaseTasks.db_dir = File.join root, 'db'
DatabaseTasks.fixtures_path = File.join root, 'test/fixtures'
DatabaseTasks.migrations_paths = [File.join(root, 'db/migrate')]
DatabaseTasks.root = root

task :environment do
  ActiveRecord::Base.configurations = DatabaseTasks.database_configuration
  ActiveRecord::Base.establish_connection ABOOK_ENV
end

namespace :grape do
  desc 'Print compiled grape routes'
  task :routes => [:environment] do
    API.routes.each do |route|
      puts route
    end
  end
end

load 'active_record/railties/databases.rake'
