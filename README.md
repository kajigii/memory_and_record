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
| person  | string     |                                |
| source  | string     |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user



# アプリケーション名

Memory_Record

# アプリケーション概要

本やドラマなどで心に残った言葉をジャンルごとに共有できる。文字数が多い時は画像で投稿することもできる。

# URL

https://memory-record-ji11.onrender.com

# テスト用アカウント

- Basic認証パスワード：raika
- Basic認証ID：1300

投稿用アカウント
- メールアドレス：test1@test.com
- パスワード：11111a

閲覧用アカウント
- メールアドレス：test2@test.com
- パスワード：22222a

# 利用方法
## ログイン
アプリを開いたらログイン画面に遷移するので、ユーザー新規登録/ログインを行う
## 投稿ルームの作成
1. トップページ(一覧ページ)のヘッダーの「新規作成ボタン」を押すとルーム作成画面に遷移する
2. ルーム名に作りたいルームの名前を入力して、全ユーザーに公開したい場合は「public」の横のチェックボックスにチェックを入れて「Create Room」を押す(非公開にしたい場合はチェックボックスには何もしないで「Create Room」を押す)

## 心に残った言葉の投稿
1. トップページ(一覧ページ)に表示されているルーム名を押すと投稿内容表示ページに遷移する
2. 投稿内容表示ページの「投稿する」ボタンを押すと投稿ページに遷移する
3. 必須項目としてフォースに心に残った言葉を入力するか画像を選択(文字数が多い時など)、任意でその言葉を言った人と出典を入力する
4. 入力が済んだら「送信」ボタンを押す

## 投稿内容の詳細、編集、削除
1. 投稿内容表示ページに表示されているコメントの「詳細」ボタンを押すとコメントの詳細を見ることができる
2. 詳細ページで自分が投稿したコメントであれば「編集　削除」ボタンが表示される
3. 「編集」ボタンを押すと編集ページに遷移して、コメントの編集ができる
4. 「削除」ボタンを押すとコメントの削除ができる


# アプリケーションを作成した背景
これまでの読書で感動する言葉に出会うことが多く、それをメモしようと考えた。しかし、メモを紙やスマートフォンに取るときには以下の課題があった。  
・長い言葉は紙へのメモでは読みにくいため写真で撮る場合があり、保存場所がバラバラになる  
・紙でメモすると感じた順に書くため、後で読み返すときに整理が難しい 
また、これらのメモを共有できれば、未読の人が新しい本に興味を持つきっかけになるのではないかと思いついた。  
私自身、本以外にもドラマやアニメ、音楽などで心に残った言葉をまとめた投稿を見かけ、その投稿をきっかけに新しい作品を発見することがありました。こういった様々なジャンルで心に残った言葉を共有する事ができれば、新たな作品を見つける手助けになるのではないかと考え、アプリケーションを開発することにした。

# 洗い出した要件
https://docs.google.com/spreadsheets/d/19nhl1I8QcBqvErB0AauDhZ1WNSx_bSD2BXbLImenTHQ/edit#gid=982722306

# 実装した機能についてのGIF
新規公開ルーム作成
https://gyazo.com/4f6d23f06ef4ef52002d51d1072e25a1

新規非公開ルーム作成
https://gyazo.com/361bc9fbb0e16eb84437a39dfebb7215

新規投稿(画像なし)
https://gyazo.com/fd80e330b1767853b1f3d3c65813c896

詳細画面へ遷移して投稿内容編集
https://gyazo.com/fd868f6f97d4ee4b03dce6bd761b03d0

別ユーザーが投稿内容と詳細画面を閲覧
https://gyazo.com/0ac9e81c8b7ba8363d9fd89aa6f3c05e

投稿内容削除
https://gyazo.com/398be733485fd3c86f3be1c8145c0beb

言葉のみを投稿した場合
https://gyazo.com/4209e746a9694eb0ac4c1e0a367f9336

画像のみを投稿した場合
https://gyazo.com/9ab4cb1ff811468a16109f45fadad49b

画像の変更
https://gyazo.com/37a1847c6073d1d3ba448bc7087be4cb

必須項目を入力しないで投稿した場合
実装予定


# 実装予定の機能
・非公開ルームのアクセス制限機能：作成者以外に非公開ルームは表示されないがURLで非公開ルームに入室が出来てしまう(編集や削除は出来ないが閲覧や新規投稿が出来てしまう)
・必須項目を入力しないで投稿した場合、入力した内容は保存されていないが、ルーム一覧から公開ルームの表示が消えてしまっている

# データベース設計
![Alt text](memory-1.png)

# 画面遷移図
![Alt text](record-1.png)

# 開発環境
Ruby/Ruby on Rails/MySQL/Github/Visual Studio Code

# ローカルでの動作方法
以下のコマンドを順に実行
% git clone 
% cd memory_and_record

# 工夫したポイント
投稿したい言葉が長文の時は画像で投稿が出来るようにした。また、投稿を見た別のユーザーが作品を探せるように作品の情報を入力できる欄を用意し、その情報は詳細画面でのみ閲覧できるようにした。

# 改善点
補足情報として入力できる「人物」や「出典」の名義は再考すべきだと考えている。例えば、本であれば今の名義でも問題ないが、音楽には対応していない。どのジャンルにも対応するような名義にすることで、入力がしやすくなるはずだ。 また、画像の大きさによっては画面を下にスクロールした時に、サイドバーが途中で切れてしまっているのでサイドバーの高さも修正する必要がある。

# 製作時間
開発期間：11/3~
１日あたりの平均作業時間：6時間
合計：