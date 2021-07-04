require 'rails_helper'

RSpec.describe 'Ideas', type: :request do
  before do
    @idea = FactoryBot.create(:idea)
    @search = { 'keyword' => '', 'commit' => '検索', 'controller' => 'ideas', 'action' => 'search' }
  end

  describe 'GET #index' do
    it 'indexアクションにリクエストすると正常にレスポンスが返ってくる' do
      get root_path
      expect(response.status).to eq 200
    end
    it 'indexアクションにリクエストするとレスポンスにidea検索フォームが存在する' do
      get root_path
      expect(response.body).to include('検索')
    end
    it 'indexアクションにリクエストするとレスポンスにidea投稿フォームが存在する' do
      get root_path
      expect(response.body).to include('投稿する')
    end
  end

  describe 'GET #new' do
    it 'newアクションにリクエストすると正常にレスポンスが返ってくる' do
      get new_idea_path
      expect(response.status).to eq 200
    end
    it 'newアクションにリクエストするとレスポンスにカテゴリー名フォームが存在する' do
      get new_idea_path
      expect(response.body).to include('カテゴリー名')
    end
    it 'newアクションにリクエストするとレスポンスに本文フォームが存在する' do
      get new_idea_path
      expect(response.body).to include('本文')
    end
    it 'newアクションにリクエストするとレスポンスにidea登録フォームが存在する' do
      get new_idea_path
      expect(response.body).to include('登録する')
    end
  end

  describe 'GET #search' do
    it 'searchアクションに検索条件なしでリクエストすると正常にレスポンスが返ってくる' do
      get search_ideas_path(@search)
      expect(response.status).to eq 200
    end
    it 'searchアクションに検索条件なしでリクエストするとレスポンスに投稿済みのideaのbodyが存在する' do
      get search_ideas_path(@search)
      expect(response.body).to include(@idea.body)
    end
    it 'searchアクションに検索条件なしでリクエストするとレスポンスに登録済みのcategoryのnameが存在する' do
      get search_ideas_path(@search)
      expect(response.body).to include(@idea.category.name)
    end
    it 'searchアクションに登録済みのカテゴリーでリクエストすると正常にレスポンスが返ってくる' do
      @search['keyword'] = @idea.category.name
      get search_ideas_path(@search)
      expect(response.status).to eq 200
    end
    it 'searchアクションに登録済みのカテゴリーでリクエストするとレスポンスに投稿済みのideaのbodyが存在する' do
      @search['keyword'] = @idea.category.name
      get search_ideas_path(@search)
      expect(response.body).to include(@idea.body)
    end
    it 'searchアクションに登録済みのカテゴリーでリクエストするとレスポンスに登録済みのcategoryのnameが存在する' do
      @search['keyword'] = @idea.category.name
      get search_ideas_path(@search)
      expect(response.body).to include(@idea.category.name)
    end
    it 'searchアクションに未登録のカテゴリーでリクエストすると404レスポンスが返ってくる' do
      @search['keyword'] = @idea.category.name + 'a'
      get search_ideas_path(@search)
      expect(response.status).to eq 404
    end
  end
end
