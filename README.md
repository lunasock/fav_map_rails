# fav_map_rails

<!-- # Short Description -->

fav map

<!-- # Badges -->

[![Github issues](https://img.shields.io/github/issues/KeisukeOmata/fav_map_rails)](https://github.com/KeisukeOmata/fav_map_rails/issues)
[![Github forks](https://img.shields.io/github/forks/KeisukeOmata/fav_map_rails)](https://github.com/KeisukeOmata/fav_map_rails/network/members)
[![Github stars](https://img.shields.io/github/stars/KeisukeOmata/fav_map_rails)](https://github.com/KeisukeOmata/fav_map_rails/stargazers)
[![Github top language](https://img.shields.io/github/languages/top/KeisukeOmata/fav_map_rails)](https://github.com/KeisukeOmata/fav_map_rails/)
[![Github license](https://img.shields.io/github/license/KeisukeOmata/fav_map_rails)](https://github.com/KeisukeOmata/fav_map_rails/)

# デモ

fav mapはお気に入りの場所を可視化するマップアプリです。
<img width="1239" alt="スクリーンショット 2019-08-29 18 23 49" src="https://user-images.githubusercontent.com/50476037/63928256-3b422900-ca8a-11e9-8bd2-f172da6741bb.png">

画面右上の住所検索か、マップをタップするとピンが表示されます。
<img width="1280" alt="pic1" src="https://user-images.githubusercontent.com/50476037/63927571-efdb4b00-ca88-11e9-8e76-c8d701ce6498.png">

場所の名前と説明を入力してカテゴリーを選択しましょう。あとは写真を添付して登録を押すだけ。
<img width="1201" alt="pic2" src="https://user-images.githubusercontent.com/50476037/63928452-878d6900-ca8a-11e9-815f-d80960076ce3.png">

先ほどの場所にアイコンが表示されます。
<img width="1244" alt="pic3" src="https://user-images.githubusercontent.com/50476037/63928533-ae4b9f80-ca8a-11e9-8e8e-6fcaf65f3128.png">

お気に入りの場所にはぜひ口コミを投稿してください。
<img width="1239" alt="pic4" src="https://user-images.githubusercontent.com/50476037/63928585-c3c0c980-ca8a-11e9-8914-595be2aac1ac.png">

# インストール

Ruby 2.7.1  
Ruby on Rails 6.0.3

git clone git@github.com:KeisukeOmata/fav_map_rails.git
<br>
cd fav_map_rails
<br>
bin/bundle install
<br>
bin/rails db:migrate
<br>
bin/rails s -b 0.0.0.0

Google Maps APIを利用しています。
<br>
環境変数'GOOGLE_MAP_API_KEY'にご自身のAPI キーの設定をお願いします。

# 作者

- [KeisukeOmata](https://github.com/KeisukeOmata)

<!-- CREATED_BY_LEADYOU_README_GENERATOR -->