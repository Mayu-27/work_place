# README

# アプリケーション名
Coworking Spot

# アプリケーション概要
東京近郊のコワーキングカフェをGoogle Map上で探すことができるアプリケーショを作成しました。
ユーザーを登録するとクチコミの投稿と、お気に入り登録が可能です。

# URL
http://co-woriking-spot.com/

# テスト用アカウント
メールアドレス：sample111@gmail.com
パスワード：sample111

# 利用方法
トップページにてGoogle Mapもしくはピックアップスポットからコワーキングカフェを探し該当の店舗詳細ページに遷移できます。
「お気に入り登録」のボタンでお気に入りに登録でき、「クチコミ投稿する」のボタンでクチコミ投稿ページに遷移します。
総合評価や詳細評価は星をクリックして点数をつけることができ、コメントの投稿も可能です。
ユーザーのお気に入り一覧やクチコミ一覧はマイページ上で確認、編集、削除ができます。

# 目指した課題解決
新型コロナの影響でリモートワークが推奨されている中、フリーランス以外の会社員もコワーキングカフェを利用する機会が今後増えていくと考えられます。
都内のコワーキングカフェの情報を探す際、情報が一箇所にまとまっているサイトがあれば便利と考え、店舗一覧がマップ上で表示され、利用者のクチコミの投稿・閲覧ができるアプリケーションを作成しました。


# 使用技術

## フロントエンド
HTML, CSS, JavaScript, jQuery

## バックエンド
Ruby, Ruby on Rails

## データベース
MySQL, Sequel Pro

## インフラ
AWS(EC2)

## Webサーバ（本番環境）
nginx

## アプリケーションサーバ（本番環境）
unicorn

## API
Google Maps API

## スクレイピング
Nokogiri

## ソース管理
GitHub, GitHubDesktop

## テスト
Rspec

## エディタ
VScode


# 実装予定の機能
•店舗画像のスクレイピングでの取得、DB保存
•ユーザー登録時の画像のプレビュー表示
•カフェ検索機能

# データベース設計  

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------  | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| last_name          | string  | null: false |
| first_name         | string  | null: false |
| kana_last_name     | string  | null: false |
| kana_fist_name     | string  | null: false |
| birth_date         | date    | null: false |

### Association
- has_many :favorites
- has_many :reviews


## spots テーブル

| Column             | Type    | Options     |
| ------------------ | ------  | ----------- |
| shop_name          | string  | null: false |
| address            | string  | null: false |
| phone_number       | string  | null: false |
| opening_hours      | string  | null: false |
| non_business_day   | string  | null: false |
| latitude           | decimal | 
| longitude          | decimal | 

### Association
- has_many :reviews
- has_many :favorites


## reviews テーブル

| Column             | Type    | Options     |
| ------------------ | ------  | ----------- |
| overall_evaluation | float   | null: false |
| comment            | text    | null: false |
| atmosphere         | float   | null: false |
| facility           | float   | null: false |
| network_stability  | float   | null: false |
| congestion         | float   | null: false |
| corona_countermeasure | float | null: false |
| user               | references  | null: false |
| spot               | references  | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :spot


## favorites テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| user               | references | null: false |
| spot               | references | null: false |

### Association
- belongs_to :user
- belongs_to :spot
