class CreateGithubUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :github_users do |t|
      # referencesとforeign_key: trueで外部キー制約
      # デフォルトはインデックスを貼る
      # t.references :user, foreign_key: true, null: false
      t.integer :user_id
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

    # # 中間テーブル
    # create_table :join_table do |t|
    #   # referencesとforeign_key: trueで外部キー制約
    #   # ユニークインデックスを貼っているため、referencesで作られるindexはfalseにしておく
    #   t.references :user, null: false, foreign_key: true, index: false
    #   t.references :spot, null: false, foreign_key: true, index: false

    #   t.timestamps
    # end

    # # ユニークインデックスを貼る
    # add_index :join_table, %i[user_id spot_id], unique: true

  end
end
