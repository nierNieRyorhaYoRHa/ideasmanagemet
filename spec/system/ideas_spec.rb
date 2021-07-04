require 'rails_helper'

RSpec.describe "Ideas", type: :system do
  before do
    @idea = FactoryBot.create(:idea)
  end

  context 'idea/category登録ができるとき' do 
    it '既にあるカテゴリーでアイデア登録ができて201が返ってくる' do
      # トップページに移動する
      visit root_path
      # トップページに投稿ページへ遷移するボタンがあることを確認する
      expect(page).to have_content('投稿する')
      # 新規登録ページへ移動する
      visit new_idea_path
      # idea/categoryを入力する
      fill_in 'カテゴリー名', with: @idea.category.name
      fill_in '本文', with: @idea.body
      # 登録ボタンを押すとideaモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Idea.count }.by(1)
      # 201が返ってきたことを確認する
      expect(page).to have_content('201')
    end

    it '新しいカテゴリーでアイデア登録ができて201が返ってくる' do
      # トップページに移動する
      visit root_path
      # トップページに投稿ページへ遷移するボタンがあることを確認する
      expect(page).to have_content('投稿する')
      # 新規登録ページへ移動する
      visit new_idea_path
      # idea/categoryを入力する
      fill_in 'カテゴリー名', with: @idea.category.name + "a"
      fill_in '本文', with: @idea.body
      # 登録ボタンを押すとcategoryモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Category.count }.by(1)
      # 201が返ってきたことを確認する
      expect(page).to have_content('201')
    end
  end

  context 'idea登録ができないとき' do
    it '誤った情報ではidea登録ができずにHTTPステータスコード422が返ってくる' do
      # トップページに移動する
      visit root_path
      # トップページに投稿ページへ遷移するボタンがあることを確認する
      expect(page).to have_content('投稿する')
      # 新規登録ページへ移動する
      visit new_idea_path
      # idea/categoryを入力する
      fill_in 'カテゴリー名', with: ''
      fill_in '本文', with: ''
      # 登録ボタンを押してもideaモデルのカウントは上がらないことを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Idea.count }.by(0)
      # 422が返ってきたことを確認する
      expect(page).to have_content('422')
    end
  end
end
