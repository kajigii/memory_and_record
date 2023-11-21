# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

### Association

- has_many :room_users
- has_many :rooms, through: :room_users
- has_many :words

## rooms テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

### Association

- has_many :room_users
- has_many :users, through: :room_users
- has_many :words

## room_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

## words テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user



# アプリケーション名

Memory_and_Record

# アプリケーション概要

本やドラマなどで心に残った言葉をジャンルごとに共有できる。文字数が多い時は画像で投稿することもできる。

# URL

https://memory-and-record-iq9a.onrender.com

# テスト用アカウント

- Basic認証パスワード：
- Basic認証ID：
- メールアドレス：
- パスワード：

# 利用方法
## ログイン
アプリを開いたらログイン画面に遷移するので、ユーザー新規登録/ログインを行う
## 投稿ルームの作成
1. トップページ(一覧ページ)のヘッダーの「新規作成ボタン」を押すとルーム作成画面に遷移する
2. ルーム名に作りたいルームの名前を入力して、共有者に共有したい相手を選択したら「Create Room」を押す

## 心に残った言葉の投稿
1. トップページ(一覧ページ)に表示されているルーム名を押すと投稿内容表示ページに遷移する
2. 投稿内容表示ページの「投稿する」ボタンを押すと投稿ページに遷移する
3. 入力欄に心に残った言葉を入力、必要であれば画像の選択(文字数が多い時など)したら「送信」ボタンを押す

## 投稿内容の詳細、編集、削除
1. 投稿内容表示ページに表示されているコメントの内、自分が投稿したコメントには「詳細　編集　削除」ボタンが表示され、他のユーザーが投稿したコメントには「詳細」ボタンが表示される
2. 「詳細」ボタンを押すとコメントの詳細を見ることができ、自分が投稿したコメントであれば「編集　削除」ボタンが表示される
3. 「編集」ボタンを押すと編集ページに遷移して、コメントの編集ができる
4. 「削除」ボタンを押すとコメントの削除ができる


# アプリケーションを作成した背景
これまでの読書で感動する言葉に出会うことが多く、それをメモしようと考えた。しかし、メモを紙やスマートフォンに取るときには以下の課題があった。
・長い言葉は紙へのメモでは読みにくいため写真で撮る場合があり、保存場所がバラバラになる
・紙でメモすると感じた順に書くため、後で読み返すときに整理が難しい
また、これらのメモを共有できれば、未読の人が新しい本に興味を持つきっかけになるのではないかと思いついた。
私自身、本以外にもドラマやアニメ、音楽などで心に残った言葉をまとめた投稿を見かけ、その投稿をきっかけに新しい作品を発見することがありました。こういった様々なジャンルで心に残った言葉を共有する事ができれば、新たな作品を見つける手助けになるのではないかと考え、アプリケーションを開発することにした。



# 洗い出した要件


# 実装した機能についての画像


# 実装予定の機能
roomの公開/非公開の分岐処理を実装予定(非公開のroomは自分のみ閲覧可能)

# データベース設計


# 画面遷移図


# 開発環境
Ruby/Ruby on Rails/MySQL/Github/Visual Studio Code

# ローカルでの動作方法


# 工夫したポイント


# 改善点


# 製作時間
開発期間：11/3~
１日あたりの平均作業時間：4時間
合計：