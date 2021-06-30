class Category < ApplicationRecord
  has_many :idea
  validates :name,
    presence: true,
    uniqueness: true
end
