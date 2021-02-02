# Music Funs

## 概要
「気の合う音楽仲間が周りにいない」、コロナ禍で「音楽で盛り上がれる場がない」、そんな方達の悩みを解決するアプリケーションです。  
同じアーティストのファン同士のコミュニティ(チャンネル)を作成できるので、どこでも好きな時に気の合う仲間とチャンネル内でコミュニケーションをとることができます。

## コンセプト
音楽に特化したコミュニティアプリ

## バージョン
Ruby 2.6.5 Rails 5.2.4.4

## 機能一覧
- [ ] ユーザー登録機能
- [ ] ログイン機能
- [ ] ユーザープロフィール編集機能
- [ ] チャンネル作成・保存機能
- [ ] チャンネル登録(お気に入り)機能
- [ ] チャンネル検索機能
- [ ] チャンネルへのコメント投稿機能
- [ ] チャンネル一覧表示機能


## カタログ設計
https://docs.google.com/spreadsheets/d/1__nubhpjCkzqDlt746cDpGtMPEZrJeU6qRB7qcpNRHk/edit#gid=0

## テーブル定義
https://docs.google.com/spreadsheets/d/1__nubhpjCkzqDlt746cDpGtMPEZrJeU6qRB7qcpNRHk/edit#gid=1513939949

## ER図
https://docs.google.com/spreadsheets/d/1__nubhpjCkzqDlt746cDpGtMPEZrJeU6qRB7qcpNRHk/edit#gid=243667199

## 画面遷移図
https://docs.google.com/spreadsheets/d/1__nubhpjCkzqDlt746cDpGtMPEZrJeU6qRB7qcpNRHk/edit#gid=1296763949

## 画面ワイヤーフレーム
https://docs.google.com/spreadsheets/d/1__nubhpjCkzqDlt746cDpGtMPEZrJeU6qRB7qcpNRHk/edit#gid=98512661



## 使用予定Gem
- dotenv-rails
- bcrypt
- kaminari
- carrierwave
- mini_magick
- rspotify
- wikipedia-client
- fog-aws
- unicorn
- mini_racer
- mini_racer, platforms: :ruby

## 使用予定API
- [Spotify Web API](https://developer.spotify.com/documentation/web-api/)