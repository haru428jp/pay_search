# テーブル設計

## usersテーブル

| Column             | Type   | Options                       |
| ------------------ | ------ | ----------------------------- |
| name               | string | null: false                   |
| email              | string | null: false, unique: true     |
| encrypted_password | string | null: false                   |


### Association

- has_many :spots

## spotsテーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| name      | string     | null: false                    |
| address   | string     | null: false                    |
| latitude  | float      | null: false                    |
| longitude | float      | null: false                    |
| user      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :spot_tags

## spot_tagsテーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| spot_id   | references | null: false, foreign_key: true |
| tag_ids   | references | null: false, foreign_key: true |

### Association

- belongs_to :spot
- belongs_to :tag
