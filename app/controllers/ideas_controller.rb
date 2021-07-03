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
        response_success(:category, :idea, :create)
      else
        response_unprocessable_entity(:idea)
      end
    else
      response_unprocessable_entity(:category)
    end
  end

  def search
    @ideas = Idea.search(params[:keyword])
    response_not_found(:idea) if @ideas.blank?
  end

  private

  def category_params
    params.permit(:name)
  end

  def idea_params(categoryid)
    params.permit(:body).merge(category_id: categoryid.id)
  end
end
