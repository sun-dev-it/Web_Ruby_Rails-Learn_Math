class Snapshot < ApplicationRecord
  has_many :comments
  belongs_to :user
  has_one_attached :image
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 250 }

  validates :image, #content_type: { in: [image/jpeg, image/gif, image/png ], message: "jpeg, gif, png"},
                                  size: {less_than: 5.megabytes, message: "5MB!"}

  #def display_image
  #  image.variant(resize_to_limit: [500, 500])
  #end
end

