class Idea < ApplicationRecord
  belongs_to :category

  validates :body,
    presence: true

  def self.search(search)
    if search != ""
      category = Category.where(name: "#{search}")
      Idea.includes(:category).where("category_id = ?","#{category.ids[0]}")
    else
      Idea.all
    end
  end
end
