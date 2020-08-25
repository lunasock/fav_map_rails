class GithubUser < ApplicationRecord
  # 引数で渡された値を格納
  def self.find_or_create_from_auth_hash!(auth_hash)
    provider = auth_hash[:provider]
    uid = auth_hash[:uid]
    user_id = 1
    
    # Active Recordのfind_or_create_by!メソッド
    # 引数で渡したレコードがあれば、そのオブジェクトを返す
    # なければレコードを作成し、そのオブジェクトを返す
    GithubUser.find_or_create_by!(user_id: user_id, provider: provider, uid: uid) do |user|
      user.user_id = user_id
    end
  end
end
