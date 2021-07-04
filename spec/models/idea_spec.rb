require 'rails_helper'

RSpec.describe Idea, type: :model do
  before do
    @idea = FactoryBot.build(:idea)
  end

  describe 'アイデアの保存' do
    context 'アイデアが保存できる場合' do
      it 'bodyがあれば投稿できる' do
        expect(@idea).to be_valid
      end
    end

    context 'アイデアが保存できない場合' do
      it 'bodyが空では投稿できない' do
        @idea.body = ''
        @idea.valid?
        expect(@idea.errors.full_messages).to include("Body can't be blank")
      end     
      it 'categoryが紐付いていなければ投稿できない' do
        @idea.category = nil
        @idea.valid?
        expect(@idea.errors.full_messages).to include('Category must exist')
      end
    end
  end
end
