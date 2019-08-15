class Post < ApplicationRecord

  attachment :review_image

  belongs_to :user
  belongs_to :spot, optional: true

end
