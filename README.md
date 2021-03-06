# アプリの概要
---
Audio Reviews はアプリ上でアイテムの登録、登録されたアイテムに対してレビューを投稿出来る口コミアプリです。

![demo](https://raw.github.com/wiki/yutaro256/audio-reviews/images/demo.gif)

# 開発環境
---
* ubuntu 18.04
* Ruby on Rails 5.2.3
* Ruby 2.5.1
* MySQL 5.7
* bootstrap 4.3
* docker, docker-compose（ローカルサーバーの構築）
* git（バージョン管理）
* heroku（デプロイ）

# アプリの機能
---
* ユーザー情報の登録・編集
* ログイン・ログアウト機能（Eメール、パスワードで認証）
* アイテムの登録
* アイテムに対するレビューの投稿・編集
* アイテムの編集が可能な管理者アカウント
* ユーザーに紐付けてアイテムをリストへ追加する機能（気になるリスト）
* アイテム・レビュー・気になるリストの一覧表示とページネーション機能
* サイト内検索機能


# ローカルサーバー構築
---
audio-reviewsディレクトリ(docker-compose.ymlがあるディレクトリ)で次のコマンドを実行  

`sudo mysql service stop`  
`sudo docker-compose up -d`  
`sudo docker-compose web rails db:create`  
`sudo docker-compose web rails db:migrate`  

localhost:3000にアクセス  

終了時は  `sudo docker-compose down`