Snapshot.delete_all
User.delete_all
User.create!(name: "admin", email: "admin@gmail.com", password: "090502", password_confirmation: "090502", admin: true)

i = 1
30.times do
    name = "User#{i}"
    email = "user#{i}@gmail.com"
    User.create(name: name, email: email, password: "123456", password_confirmation: "123456")
    i += 1
end

i = 1
users = User.order(:created_ad).take(5)
3.times do
    content = "Bài viết #{i}"
    users.each { |user| user.snapshots.create!(content: content) }
    i += 1
end

users = User.all
admin = User.find_by(email: "admin@gmail.com")
users.each do |user|
    next if user == admin

    user.follow(admin)
end