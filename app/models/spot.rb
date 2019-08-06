class Spot < ApplicationRecord

  attachment :spot_image

  geocoded_by :address
  after_validation :geocode, if: :address_changed?  

end
