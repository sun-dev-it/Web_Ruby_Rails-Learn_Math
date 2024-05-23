#=begin
Snapshot.delete_all
User.delete_all

# Tạo admin
user = User.create!(name: "admin", email: "admin@gmail.com", password: "090502", password_confirmation: "090502", admin: true)
avatar_path = Rails.root.join("app", "assets", "images", "avatar_user", "admin.jpeg")
avatar_file = File.open(avatar_path)
user.avatar.attach(io: avatar_file, filename: "admin.jpeg", content_type: 'image/png')


listname = ["Phát", "Lan", "Phong", "Mai", "Tài", "Thư"]
listemail = ["phat", "lan", "phong", "Mai", "tai", "thu"]
listavatar = ["phat.jpeg", 
              "lan.jpeg", 
              "phong.jpeg", 
              "mai.jpeg", 
              "tai.jpeg",
              "thu.jpeg"]

6.times do |i|
  name = listname[i]
  email = listemail[i].to_s + "@gmail.com"
  user = User.create(name: name, email: email, password: "123456", password_confirmation: "123456")

  avatar = listavatar[i]
  avatar_path = Rails.root.join("app", "assets", "images", "avatar_user", avatar)
  avatar_file = File.open(avatar_path)
  user.avatar.attach(io: avatar_file, filename: avatar, content_type: 'image/png')
end


users = User.order(:created_at)
users.each do |user|
  content = "Xin chào, tôi là #{user.name}!"
  user.snapshots.create!(content: content)
end


users = User.all
admin = User.find_by(email: "admin@gmail.com")
users.each do |user|
    next if user == admin
    user.follow(admin)
end

#=end


#N5
#Flashcard.delete_all
