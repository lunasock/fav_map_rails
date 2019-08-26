class Post < ApplicationRecord

  attachment :review_image

  belongs_to :user
  belongs_to :spot

  validates :review_body, length: { maximum: 100 }
  
end
