require './boot'

include ActiveRecord::Tasks

DatabaseTasks.env = ABOOK_ENV
DatabaseTasks.database_configuration = YAML.load(
    ERB.new(
        File.read(
            ABOOK_PATH.join('./config/database.yml'))).result)

root = File.expand_path '..', __FILE__

DatabaseTasks.db_dir = File.join root, 'db'
DatabaseTasks.fixtures_path = File.join root, 'test/fixtures'
DatabaseTasks.migrations_paths = [File.join(root, 'db/migrate')]
DatabaseTasks.root = root

task :environment do
  ActiveRecord::Base.establish_connection ABOOK_ENV
end

load 'active_record/railties/databases.rake'
