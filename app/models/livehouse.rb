class Livehouse < ApplicationRecord

  attachment :livehouse_image

  geocoded_by :address
  after_validation :geocode, if: :address_changed?  

  enum category: { ライブハウス: 0 }

end
