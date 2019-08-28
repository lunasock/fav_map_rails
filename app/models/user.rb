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

  validates :user_name, length: { maximum: 8 }
  validates :user_body, length: { maximum: 44 }

  validates :accepted, presence: {message: 'を入力してください'}

end
