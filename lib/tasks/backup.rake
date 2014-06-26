namespace :db do
  desc "Backup database to Backup Dir"
  task :backup do
    datestamp = Time.now.strftime("%Y-%m-%d_%H-%M-%S")
    backup_file = "~/Backup/#{Rails.root.basename}-#{datestamp}.sql"
    db_config = Rails.configuration.database_configuration[Rails.env]

    # Create backup dir
    system("mkdir -p ~/Backup")

    # process backup
    system("pg_dump #{db_config['database']} -f #{backup_file}")
  end

  desc "Keep last 10 backups"
  task :rotate do
    system("find ~/Backup/ -type f -printf '%T@ %p\n' | sort -n | cut -d' ' -f2- | head -n -10 | xargs rm")
  end
end
