class IdeasController < ApplicationController
  def index
    @ideas = Idea.includes(:category)
  end

  def new
  end

  def create
    category = Category.new(category_params)
    categoryid = Category.where(name: category.name).first_or_initialize
    if categoryid.valid?
      categoryid.save
      idea = Idea.new(idea_params(categoryid))
      if idea.valid?
        idea.save
        redirect_to action: :index
      else
        render action: :new
      end
    else
      render action: :new
    end
  end

  private

  def category_params
    params.permit(:name)
  end

  def idea_params(categoryid)
    params.permit(:body).merge(category_id: categoryid.id)
  end
end