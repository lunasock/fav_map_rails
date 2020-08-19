class CreateGithubUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :github_users do |t|
      # not nill制約
      t.string :user_id, null: false
      t.string :provider, null: false
      t.string :uid, null: false

      t.timestamps
    end

    # インデックスを貼る
    add_index :github_users, %i[user_id provider uid], unique: true
  end
end
