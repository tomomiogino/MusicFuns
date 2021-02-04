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
- [ ] ユーザーフォロー機能
- [ ] アーティストページ作成機能
- [ ] アーティスト一覧・検索機能
- [ ] アーティストファン登録機能
- [ ] チャンネル作成・保存機能
- [ ] チャンネルへのコメント投稿機能



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

## 使用予定API
- [Spotify Web API](https://developer.spotify.com/documentation/web-api/)

## 課題要件
* 就業Termからの技術
  * コメント機能（投稿/編集/削除。投稿失敗時にエラーメッセージをAjaxで出力）
  * フォロー機能

* カリキュラム外の技術
  * Spotify Web API
  * gem 'rspotify'  
  (アーティストページの作成/検索機能に使用)