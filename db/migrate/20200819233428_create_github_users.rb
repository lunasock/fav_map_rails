class CreateGithubUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :github_users do |t|
      # 外部キー制約
      t.references :user, foreign_key: true, null: false
      t.string :provider, null: false
      t.string :uid, null: false

      t.timestamps
    end

    # インデックスを貼る
    # データ量が多く、少量のレコードを検索するとき
    # Where句の条件として頻繁に利用するとき
    # 頻繁に挿入、更新されたり、0 or 1、nullがあるカラムには貼らない
    # user_idには外部キー制約の記載でindexが貼られる
    add_index :github_users, %i[provider uid], unique: true
  end
end
