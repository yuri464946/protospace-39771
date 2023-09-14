# テーブル設計

## users テーブル

| Column             | Type   | Options                |
| ------------------ | ------ | ---------------------- |
| name               | string | null: false            |
| email              | string | null: false,unique true|
| encrypted_password | string | null: false            |
| position           | text   | null: false            |
| occupation         | text   | null: false            |
| position           | text   | null: false            |

### Association

- has_many :prototypes
- has_many :comments

## prototypes テーブル

| Column | Type           | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| title      | string     | null: false                    |
| catch_copy | text       | null: false                    |
| concept    | text       | null: false                    |

### Association

- belongs_to :user
- has_many :comments

## comments テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| content  | text       | null: false                    |
| prototype| references | null: false, foreign_key: true |
| user     | references | null: false, foreign_key: true |

### Association

- belongs_to :prototype
- belongs_to :user