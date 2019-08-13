class Livehouse < ApplicationRecord

  attachment :livehouse_image

  geocoded_by :address
  after_validation :geocode, if: :address_changed?  

  enum category: { ライブハウス: 0 }

    def self.search(search)
        if search
          relation = Item.joins(discs: :tracklists)
          relation.where(['item_name LIKE ? ', "%#{search}%"]).or(relation.where(['track_name LIKE ? ', "%#{search}%"]))
        else
          Item.all
        end
      end

end
