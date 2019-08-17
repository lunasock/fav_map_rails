class Spot < ApplicationRecord

  attachment :spot_image

  geocoded_by :address
  after_validation :geocode, if: :address_changed?  

  enum category: { ライブハウス: 0, ラーメン屋: 1, 居酒屋: 2, 喫茶店: 3, 駐車場: 4, その他: 5 }

  has_many :posts
  belongs_to :user

end
