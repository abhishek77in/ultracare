namespace :data_changes do
  desc 'Create standard users'
  task :create_user => :environment do
    User.create(email: 'user@example.com', password: 'abcd1234')
    puts "user@example.com, abcd1234 created."
    User.create(email: 'admin@example.com', password: 'kdue2738', role: 'admin')
  end
end

# Run following command to create a user
# bundle exec rake "data_changes:create_user[test@example.com,abcd1234]"
# bundle exec rake "data_changes:create_user[admin@example.com,abcd1234,admin]"
