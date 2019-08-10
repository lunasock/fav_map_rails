class Livehouse < ApplicationRecord

    def self.search(search)
        if search
          relation = Item.joins(discs: :tracklists)
          relation.where(['item_name LIKE ? ', "%#{search}%"]).or(relation.where(['track_name LIKE ? ', "%#{search}%"]))
        else
          Item.all
        end
      end

end
