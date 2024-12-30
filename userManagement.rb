# Create User
user = User.new(username: 'toufa7', email: 'me@toufa7.me', name: 'Omar Toufah', password: 'password', password_confirmation: 'password')
user.save!

# Update User
user = User.where("name ILIKE '%toufa7%'")
user.update_attributes(password: 'newpassword', password_confirmation: 'newpassword')
uder.save!

# Find User
user = User.find_by_username("toufa7")
user = User.find_by_id(id)
user = User.find_by_sql("SELECT * FROM users WHERE name LIKE '%toufa7%'")
user = User.where("name ILIKE '%toufa7%'")

# Delete User
user = User.find_by_username("toufa7")
user.destroy!

# List Users
users = User.all
users.each do |user|
    puts "-------------------------"
    puts "Username: #{user.username}"
    puts "Email: #{user.email}"
    puts "Name: #{user.name}"
    puts "Created At: #{user.created_at}"
end