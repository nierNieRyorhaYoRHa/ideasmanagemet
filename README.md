# ideasmanagement

# Requirement

* Ruby   2.6.5
* Rails  6.0.0
* mysql2 0.5.3

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