namespace :data_changes do
  desc 'Create user'
  task :create_user, [:email, :password] => :environment do |t, args|
    User.create_with(password: args[:password]).find_or_create_by(email: args[:email])
    puts "User created / updated."
  end
end

# Run following command to create a user
# bundle exec rake "data_changes:create_user[abhishek@gmail.com,abhishek]"
