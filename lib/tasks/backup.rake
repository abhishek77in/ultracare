namespace :db do  desc "Backup database to AWS-S3"
  task :backup => :environment do
    datestamp = Time.now.strftime("%Y-%m-%d_%H-%M-%S")
    backup_file = "~/Backup/#{Rails.root.basename}-#{datestamp}.sql"
    db_config = Rails.configuration.database_configuration[Rails.env]

    # Create backup dir
    system("mkdir -p ~/Backup")

    # process backup
    system("pg_dump #{db_config['database']} -f #{backup_file}")
  end
end
