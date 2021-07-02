# README

# Table design
## categories table

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| name   | string     | null: false, unique: true      |

### Association
- has_many :ideas


## ideas table

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| categories | references | null: false, foreign_key: true |
| body       | text       | null: false                    |

### Association
- belongs_to :category