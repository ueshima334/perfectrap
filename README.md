# アプリ名

Perfect Rap(競馬レースラップ分析アプリ)

# 概要

競馬における「レースラップ」を分析し、次回のレースでどの馬が好走するか？という予想を助けるアプリです。

「ラップ分析」ボタンより、今後開催予定のレースを選択し、出走予定馬を確認できます。
出走馬を選択すると、今回出走するレースの過去のラップと、その馬が過去に出走したレースのラップを確認する事ができます。
レースラップと共に、その時の馬場状態と着順が確認できるようになっているので、その馬の得意なレースの特徴を知る事ができ、
今回出走するレースの特徴と照らし合わせて、好走するかを予想できます。

過去のレース情報や、馬、開催予定レースの登録は、ユーザー1のみトップページの管理画面より登録可能です。
登録方法は、競馬ラボ（競馬予想サイト）のURLをフォームに貼り付けることにより、自動的にDBに保存されるようになっています。
(過去のレース登録は、結果払い戻し画面のURL、開催予定レース登録は、出馬表画面のURL)

# 本番環境

https://perfectrap334.herokuapp.com/

# 制作背景（意図)

このアプリは、競馬初心者の方でも簡単に楽しく競馬予想ができるようにとの思いから制作しました。
アプリを作ろうと思ったきっかけは、自分の周りに競馬ファンが少なく、もっとたくさんの人に競馬の楽しさを知って欲しいと思ったからです。

開発の構想段階で、競馬をやらない理由を考えた際、「予想する際の要素や方法が多く、どれも初心者には分かりにくいから」ではないか、と思いました。

そこで、私が目をつけたのが「ラップ分析」という競馬の予想方法です。
他の予想方法に比べて、マイナーではあるものの、初心者に分かりやすく、説得力があるものだと思ったからです。

ラップ分析とは、レースを200ｍ毎に区切りその区間毎の走破タイムを調べます。
そして、区間ラップ毎の増減幅や、前半が早い、後半が早いなどの傾向によりレースの特徴を把握します。
馬によって、得意なレースの特徴や苦手なレースの特徴がありますので、過去に好走・凡走してきたレースの特徴を調べる事で、次回のレースで好走できるかどうかが分かると言う予想方法です。

競馬は私にとってとても興奮するスポーツであります。見ているだけでも楽しいですが、好きな馬の馬券を買ったり、予想が当たった時に楽しさは倍増すると思っています。

このアプリが競馬を始めるきっかけになり、共に興奮を味わう事ができる事を望んでいます。

# DEMO

## トップページ
![トップページ](https://i.gyazo.com/8cec1a12ec73b8de118bcecbadba863b.jpg)

## レース選択〜出走馬確認画面
![レース選択〜出走馬確認画面](https://i.gyazo.com/d5f458d1103b128e9848957a7be374cf.gif)

## 出走馬選択〜ラップ分析結果表示画面
![出走馬選択〜ラップ分析結果表示画面](https://i.gyazo.com/2ba624b5d1eb0c83f3a9d107fd3fc82b.gif)


# 工夫したポイント

データの取得は、時短の為スクレイピングを使用しました。
取得したしたラップタイムは、分かりやすいようグラフにしました。
表示させる情報は、ラップタイム分析に必要なもの最小限のみとしました。

# 使用技術(開発環境)

## バックエンド
Ruby,Ruby on Rails

## フロントエンド
HTML,CSS,JavaScript

## データベース
MySQL,SequelPro

## ソース管理
GitHub,GitHubDesctop

## エディタ
VSCode


# DB設計

## horses テーブル

| Column           | Type         | options     |
| ---------------- | ------------ | ----------- |
| name             | string       | null: false |
| horsegender_id   | integer      | null: false |
| age_id           | integer      | null: false |


## races テーブル

| Column    | Type         | options     |
| --------- | ------------ | ----------- |
| name      | string       | null: false |
| day       | date         | null: false |
| place     | string       | null: false |
| racetrack | string       | null: false |
| horse1    | string       |             |
| horse2    | string       |             |
| horse3    | string       |             |
| horse4    | string       |             |
| horse5    | string       |             |
| horse6    | string       |             |
| horse7    | string       |             |
| horse8    | string       |             |
| horse9    | string       |             |
| horse10   | string       |             |
| horse11   | string       |             |
| horse12   | string       |             |
| horse13   | string       |             |
| horse14   | string       |             |
| horse15   | string       |             |
| horse16   | string       |             |
| horse17   | string       |             |
| horse18   | string       |             |

- has_one    :rap

## raps テーブル
| Column   | Type         | options           |
| -------- | ------------ | ----------------- |
| race     | references   | foreign_key: true |
| pace     | string       | null: false       |
| 200m     | string       |                   |
| 400m     | string       |                   |
| 600m     | string       |                   |
| 800m     | string       |                   |
| 1000m    | string       |                   |
| 1200m    | string       |                   |
| 1400m    | string       |                   |
| 1600m    | string       |                   |
| 1800m    | string       |                   |
| 2000m    | string       |                   |
| 2400m    | string       |                   |
| 2600m    | string       |                   |
| 2800m    | string       |                   |
| 3000m    | string       |                   |
| 3200m    | string       |                   |

- belongs_to :race


## plans テーブル

| Column    | Type         | options     |
| --------- | ------------ | ----------- |
| title     | string       | null: false |
| grade     | string       | null: false |
| terms     | string       | null: false |
| day       | date         | null: false |
| place     | string       | null: false |
| horse1    | string       |             |
| horse2    | string       |             |
| horse3    | string       |             |
| horse4    | string       |             |
| horse5    | string       |             |
| horse6    | string       |             |
| horse7    | string       |             |
| horse8    | string       |             |
| horse9    | string       |             |
| horse10   | string       |             |
| horse11   | string       |             |
| horse12   | string       |             |
| horse13   | string       |             |
| horse14   | string       |             |
| horse15   | string       |             |
| horse16   | string       |             |
| horse17   | string       |             |
| horse18   | string       |             |
