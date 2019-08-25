class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  acts_as_paranoid

  attachment :backcover_image
  attachment :icon_image

  has_many :spots, dependent: :delete_all
  has_many :posts, dependent: :delete_all

end
