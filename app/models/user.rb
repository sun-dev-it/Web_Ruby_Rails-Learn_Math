class User < ApplicationRecord
    before_save {self.email = email.downcase}
    validates :name, presence: true, length: {maximum: 60}
    validates :email, presence: true, length: {maximum: 255},
                      uniqueness: true
    has_secure_password
    validates :password, presence: true, length: {maximum: 10}, allow_nil:true
    has_many :feedbacks

    def User.digest(string)
        const = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.const
        BCrypt::Password.create(string, cost: cost)
    end
end
