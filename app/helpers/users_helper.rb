module UsersHelper
    def avatar(user)
        avatar_id=Digest::MD5::hexdigest(user.email.downcase)
        avatar_url = "https://upanh123.com/wp-content/uploads/2020/11/hinh-anh-con-meo-cute3.jpg"
        image_tag(avatar_url, alt: user.name, class: "avatar")
    end
end
