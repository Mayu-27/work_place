# README

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
| genre_id           | integer | null: false |
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
| congestion         | float   | null: false |
| countermeasure     | float   | null: false |
| client             | integer | null: false |
| user               | references  | null: false |
| spot               | references  | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :spot


## favorites テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| spot               | references | null: false |
| user               | references | null: false |

### Association
- belongs_to :user
- belongs_to :spot


# アプリケーション名
Coworking Spot

# アプリケーション概要
東京都内のコワーキングカフェをGoogle Map上で探すことができるアプリケーショを作成しました。
ユーザーを登録するとクチコミの投稿と、お気に入り登録ができるようになります。
自信が投稿したクチコミは、編集と削除が可能です。
お気に入り登録についてもお気に入りの解除が可能です。

# URL
デプロイ後記述します。

# テスト用アカウント
デプロイ後記述します。

# 利用方法
デプロイ後記述します。

# 目指した課題解決
新型コロナの影響でリモートワークが推奨されている中、フリーランス以外の会社員もコワーキングカフェを利用する機会が今後増えていくと考えられます。
都内のコワーキングカフェの一覧表示を探す際、情報が一箇所にまとまっているサイトがなかったため、店舗一覧がマップ上で表示され、利用者のクチコミも見れるアプリケーションを作成しました。

# 洗い出した要件
コワーキングカフェの一覧表示
店舗の詳細情報表示
レビュー投稿機能
お気に入り登録機能

# 実装した機能についての画像やGIFおよびその説明
デプロイ後記述します。

# 実装予定の機能
ユーザー登録時の画像のプレビュー表示
カフェ検索機能

# データベース設計  


# ローカルでの動作方法
