class Spot < ApplicationRecord

  attachment :spot_image

  geocoded_by :address
  after_validation :geocode, if: :address_changed?  

  enum category: { ラーメン屋: 0, 居酒屋: 1, 喫茶店: 2, 駐車場: 3, その他: 4 }

end
