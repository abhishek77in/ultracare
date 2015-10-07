namespace :data_changes do
  desc 'Create user'
  task :create_user, [:email, :password, :role] => :environment do |t, args|
    # user = User.create_with(password: args[:password]).find_or_create_by(email: args[:email], role: args[:role])
    user = User.where(email: args[:email]).first_or_initialize
    user.password = args[:password]
    user.role = args[:role]
    if user.save
      puts "User created / updated with email: #{args[:email]}, role: #{args[:role]}"
    else
      puts 'Failed to created / update user.'
    end
  end
end

# Run following command to create a user
# bundle exec rake "data_changes:create_user[test@example.com,abcd1234]"
# bundle exec rake "data_changes:create_user[admin@example.com,abcd1234,admin]"
