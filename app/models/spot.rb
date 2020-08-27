class Spot < ApplicationRecord

  attachment :spot_image

  enum category: { 
    ライブハウス: 0,
    ラーメン屋: 1,
    居酒屋: 2,
    喫茶店: 3,
    駐車場: 4,
    その他: 5
  }

  # 1対1 => has_one
  # 多対多 => has_many :hoges, through: :中間テーブル
  # 中間テーブルはそれぞれのテーブルのidだけを持つ
  has_many :posts, dependent: :delete_all
  belongs_to :user
  # 明示的な名前にもできる
  # 外部キーをデフォルト以外にする場合
  # has_many :created_posts, class_name: "Post", foreign_key: "hoge_id"

  # presence: trueでNot Null
  validates :spot_name, presence: true, length: { maximum: 16 }
  validates :category, presence: true
  validates :address, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :spot_body, length: { maximum: 100 }
  # validates do |spot|
  #   if spot.spot_name.include?("hoge")
  #     spot.error[:spot_name] << "hoge"
  #   end
  # end

  # コールバック(after_destroyやbefore_saveなど)
  # before_validation do
  #   if spot.spot_name.include?("hoge")
  #     # 保存前に行う処理
  #   end
  # end

  # スコープを設定する
  # contはカラム名
  # scope :costly, -> { where("cost > ?", 1000) }
  # => Hoge.costlyで呼び出せる
  # nameはカラム名
  # scope :named, ->(theme) { where("name like ?", "%#{theme}%") }
  # => Hoge.costly.named("hoge")で呼び出せる
  # nilを返す場合はクラスメソッドで定義する

  # バリデーションを自作する
  # validates :start_at_should_be_before_end_at
  # def start_at_should_be_before_end_at
  #   return unless start_at && end_at

  #   if start_at >= end_at
  #     errors.add(:start_at, "は終了時間よりも前に設定してください")
  #   end
  # end

end
